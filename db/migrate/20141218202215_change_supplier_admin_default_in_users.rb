class ChangeSupplierAdminDefaultInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :supplier_admin, false
  end
end
