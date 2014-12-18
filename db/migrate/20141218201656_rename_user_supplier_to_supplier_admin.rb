class RenameUserSupplierToSupplierAdmin < ActiveRecord::Migration
  def change
    rename_column :users, :supplier, :supplier_admin
  end
end
