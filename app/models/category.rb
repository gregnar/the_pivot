class Category < ActiveRecord::Base
  has_many :categories_items
  has_many :items, through: :categories_items
  validates :name, presence: true
  belongs_to :supplier

  def slug
    name.parameterize
  end

  def total_items
    Item.all.select do |item|
      item.categories.any? { |cat| cat.name == self.name }
    end.count
  end

end
