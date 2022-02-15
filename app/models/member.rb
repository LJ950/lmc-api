class Member < ApplicationRecord
  # attr_accessor :selected, :reset_token
  # has_one :membership, dependent: :destroy
  # has_one :emergency_contact, dependent: :destroy
  # has_many :attendees, dependent: :destroy
  has_many :meets, through: :attendees
  # has_many :emails

  # accepts_nested_attributes_for :membership, :emergency_contact, :meets

  # before_create { build_membership }
  # before_create { build_emergency_contact }

  before_save { email.downcase! }
  before_save { postcode.upcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :address_1,     presence: true, length: { maximum: 100 }
  validates :address_2,     length: { maximum: 100 }
  validates :address_3,     length: { maximum: 100 }
  validates :town,          presence: true, length: { maximum: 50 }
  validates :postcode,      presence: true, length: { maximum: 10 }
  validates :country,       presence: true, inclusion: { in: COUNTRIES }
  validates :email,         presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                            uniqueness: { case_sensitive: false }
  validates :experience,    length: { maximum: 1100 }
  validates :accept_risks,  acceptance: { accept: true, message: 'You must accept the participation statement' }
  validates :firebase_id,   presence: true

  # has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
