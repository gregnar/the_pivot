class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_one :supplier_user
  has_one :supplier, through: :supplier_user



  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :determine_supplier_admin

  def determine_supplier_admin
    self.supplier ? self.supplier_admin = true : self.supplier_admin = false
  end

  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :display_name, allow_blank: true, length: { in: 2..32 }
  validates :password, length: { minimum: 6 }, allow_blank: true
end
