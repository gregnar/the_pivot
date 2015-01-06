class RemoveSupplierIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :supplier_id, :integer
  end
end
