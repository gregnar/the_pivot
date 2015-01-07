class AddUnitWeightToItem < ActiveRecord::Migration
  def change
    add_column :items, :unit_weight, :integer
  end
end
