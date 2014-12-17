class Supplier < ActiveRecord::Base
  has_one :address
  has_many :items
  has_many :users, through: :suppliers_users

  before_save :generate_slug

  validates :name, :phone, :description, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
  format: { with: EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  def generate_slug
    self.slug = name.parameterize
  end
end
