class AddSlugToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :slug, :string
  end
end
