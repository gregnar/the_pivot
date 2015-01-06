class ChangeItemOrdersNull < ActiveRecord::Migration
  def change
    change_column_null :item_orders, :item_id, true
    change_column_null :item_orders, :order_id, true
  end
end
