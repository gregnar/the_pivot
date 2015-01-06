class ItemOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  after_save :delete_if_no_item_id

  def delete_if_no_item_id
    destroy if item_id.nil? || !item.present?
  end

end
