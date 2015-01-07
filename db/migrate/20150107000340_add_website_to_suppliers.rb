class AddWebsiteToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :website, :text
  end
end
