class RemoveAddressIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :address_id, :integer
  end
end
