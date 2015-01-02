class AddSupplierIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :supplier_id, :integer
  end
end
