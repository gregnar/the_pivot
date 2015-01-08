class Item < ActiveRecord::Base
  has_many :categories_items
  has_many :categories, through: :categories_items
  belongs_to :supplier
  has_many :item_orders
  has_many :orders, through: :item_orders
  before_destroy :ensure_not_part_of_pending_order

  validates :title, presence: true,
                   uniqueness: { scope: :supplier_id,
                                 message: "must be unique for supplier."
                                }

  validates :description, :categories, presence: true
  validates :supplier_id, presence: true

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 },
                    format: { with: /\d+(\.\d{1,2})?/ }

  has_attached_file :photo, styles: { small: '60x60', large: '300x300>' },
                            default_url: '/images/missing_large.png'

  validates_attachment :photo, content_type: {
    content_type: ['image/jpg', 'image/jpeg',
                   'image/png', 'image/gif'] }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  rails_admin do
    configure :categories do
      label 'Categories'
    end
  end

  def retire
    return false unless ensure_not_part_of_pending_order
    self.active = false
    self.save!
  end

  def unretire
    self.active = true
    self.save
  end

  private

  def ensure_not_part_of_pending_order
    orders.none?(&:pending?)
  end

end
