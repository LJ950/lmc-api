require 'net/http'

module FirebaseTokenVerifier
  VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY = 'firebase_jwt_public_keys'
  def decode_and_validate(access_token)
    public_key = get_public_key(access_token)
    options = {
      algorithm: 'RS256',
      verify_expiration: true,
      verify_iat: true,
      verify_aud: true, aud: ENV['FIREBASE_PROJECT_ID'],
      verify_iss: true, iss: 'https://securetoken.google.com/' + ENV['FIREBASE_PROJECT_ID'],
      verify_sub: true
    }

    begin
      decoded_token = JWT.decode(access_token, public_key, !public_key.nil?, options)
    rescue JWT::ExpiredSignature
      return [nil, "Invalid access token. 'Expiration time' (exp) must be in the future."]
    rescue JWT::InvalidIatError
      return [nil, "Invalid access token. 'Issued-at time' (iat) must be in the past."]
    rescue JWT::InvalidAudError
      return [nil,
              "Invalid access token. 'Audience' (aud) must be your Firebase project ID, the unique identifier for your Firebase project."]
    rescue JWT::InvalidIssuerError
      return [nil,
              "Invalid access token. 'Issuer' (iss) Must be 'https://securetoken.google.com/<projectId>', where <projectId> is your Firebase project ID."]
    rescue JWT::InvalidSubError
      return [nil, "Invalid access token. 'Subject' (sub) Must be the UID of the user or device."]
    end

    unless decoded_token[0]['auth_time'] < DateTime.now.to_i
      return [nil, 'Invalid access token. Auth Time must be in the past.']
    end

    [decoded_token, nil]
  end

  def get_public_key(access_token)
    valid_public_keys = Rails.cache.read(VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY)
    if valid_public_keys.nil?
      uri = URI('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')
      response = Net::HTTP.get_response(uri)
      raise 'Failed to obtain valid JWT public keys from Google.' unless response.code == '200'

      max_age = response['cache-control'][/max-age=(\d+?),/m, 1]
      valid_public_keys = JSON.parse(response.body)
      Rails.cache.write(VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY, valid_public_keys, expires_in: max_age.to_i)
    end

    decoded_token = JWT.decode(access_token, nil, false)
    token_kid = decoded_token[1]['kid']
    x509 = OpenSSL::X509::Certificate.new(valid_public_keys[token_kid])

    x509.public_key
  end

  def decode_access_token(access_token)
    decoded_token, error = decode_and_validate(access_token)
    raise error unless error.nil?

    decoded_token
  end
end
