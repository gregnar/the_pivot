class MakeOrderPendingDefaultTrue < ActiveRecord::Migration
  def change
    change_column :orders, :pending, :boolean, :default => true
  end
end
