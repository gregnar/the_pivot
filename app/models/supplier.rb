class Supplier < ActiveRecord::Base
  has_one  :address
  has_many :items
  has_many :supplier_users
  has_many :users, through: :supplier_users
  has_many :categories
  has_many :orders, through: :items


  before_save :generate_slug

  validates :name, :phone, :description, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def self.with_items
    all.reject { |supplier| supplier.items.empty? }
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end

end
