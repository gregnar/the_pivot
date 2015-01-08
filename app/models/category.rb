class Category < ActiveRecord::Base

  has_many :categories_items
  has_many :items, through: :categories_items
  validates :name, presence: true
  belongs_to :supplier

  def slug
    name.parameterize
  end

  def self.find_by_slug(requested_slug)
    self.all.select { |cat| cat.slug == requested_slug }.first
  end

  def all_items
    Item.all.select do |item|
      item.categories.any? { |cat| cat.name == self.name }
    end
  end
end
