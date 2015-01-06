class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :coordinate

  has_many :item_orders
  has_many :items, through: :item_orders

  accepts_nested_attributes_for :coordinate,
                                reject_if: proc { |attributes| attributes.any?(&:blank?) },
                                allow_destroy: true

  validates_inclusion_of :pending, in: [true, false]

  validates_presence_of :coordinate



  def status
    pending ? 'Pending' : 'Paid'
  end

  def quantity(item)
    items.map(&:id).count(item)
  end

  def unique_items
    items.uniq
  end

  def line_total(item)
    item.price * quantity(item.id)
  end

  def total
    items.reduce(0){|total, item| total + item.price}
  end

  def stripe_total
    (total * 100).round
  end

  def display(price)
    "$#{sprintf("%0.2f", price)}"
  end
end
