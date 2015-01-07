class AddQuantityAvailableToItems < ActiveRecord::Migration
  def change
    add_column :items, :quantity_available, :integer
  end
end
