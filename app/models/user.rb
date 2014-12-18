class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_one :suppliers_user
  has_one :supplier, through: :suppliers_users

  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :display_name, allow_blank: true, length: { in: 2..32 }
  validates :password, length: { minimum: 6 }, allow_blank: true
end
