class AddSupplierIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :supplier_id, :integer
  end
end
