class Supplier < ActiveRecord::Base
  has_many :items
  has_many :users, through: :suppliers_users

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end


end
