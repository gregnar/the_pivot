class AddUnitSizeToItems < ActiveRecord::Migration
  def change
    add_column :items, :unit_size, :integer
  end
end
