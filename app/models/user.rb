class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_one :supplier_user
  has_one :supplier, through: :supplier_user

  has_secure_password

  before_save { |user| user.email = email.downcase }
  # before_update :supplier_admin_true,  :if     => Proc.new {|user| user.has_supplier}
  # before_update :supplier_admin_false, :unless => Proc.new {|user| user.has_supplier}


  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :display_name, allow_blank: true, length: { in: 2..32 }
  validates :password, length: { minimum: 6 }, allow_blank: true

  def supplier_admin?
    self.supplier.present?
  end

  def self.authenticate_user(email, password)
    user = find_by_email(email)
    (user.email_confirmed? ? user : nil) if user && user.authenticate(password)
  end

  def send_confirmation
    self.update(password_reset_token: SecureRandom.urlsafe_base64)
    self.update(password_reset_sent_at: Time.zone.now)
    UserMailer.confirmation_email(self).deliver
  end
end
