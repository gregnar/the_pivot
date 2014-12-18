class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_one :supplier_user
  has_one :supplier, through: :supplier_user

  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: EmailValidation::EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :display_name, allow_blank: true, length: { in: 2..32 }
  validates :password, length: { minimum: 6 }, allow_blank: true
end
