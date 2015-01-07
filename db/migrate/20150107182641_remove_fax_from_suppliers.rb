class RemoveFaxFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :fax, :string
  end
end
