class DeleteSupplierAdminFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :supplier_admin
  end
end
