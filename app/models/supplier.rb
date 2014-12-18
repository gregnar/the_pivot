class Supplier < ActiveRecord::Base
  has_one  :address
  has_many :items
  has_many :supplier_users
  has_many :users, through: :supplier_users

  before_save :generate_slug

  validates :name, :phone, :description, presence: true

  validates :email, presence: true,
  format: { with: EmailValidation::EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  def generate_slug
    self.slug = name.parameterize
  end
end
