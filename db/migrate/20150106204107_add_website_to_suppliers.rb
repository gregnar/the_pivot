class AddWebsiteToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :website, :string
  end
end
