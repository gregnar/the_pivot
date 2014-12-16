class AddCoordinateIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :coordinate_id, :integer
  end
end
