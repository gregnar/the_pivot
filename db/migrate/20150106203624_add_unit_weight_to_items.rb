class AddUnitWeightToItems < ActiveRecord::Migration
  def change
    add_column :items, :unit_weight, :integer
    add_column :items, :unit_size, :integer
  end
end
