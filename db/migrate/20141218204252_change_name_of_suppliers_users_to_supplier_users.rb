class ChangeNameOfSuppliersUsersToSupplierUsers < ActiveRecord::Migration
  def change
    rename_table :suppliers_users, :supplier_users
  end
end
