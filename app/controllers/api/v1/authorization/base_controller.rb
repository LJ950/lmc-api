class Api::V1::Authorization::BaseController < ApplicationController
  before_action :validate_token

  include FirebaseTokenVerifier

  def validate_token
    @decoded_token = decode_access_token(request.headers['Authorization'])
    render json: { error: 'invalid token' } unless @decoded_token
  end

  def current_user
    @current_user ||= Member.find_by(firebase_id: @decoded_token[0]['sub'])
  end
end
