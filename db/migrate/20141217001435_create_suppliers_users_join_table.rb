class CreateSuppliersUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :suppliers
    # add_index :suppliers_users, :user_id, :unique => true
  end
end
