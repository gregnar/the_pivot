class RemoveColumnDeliveryFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery
  end
end
