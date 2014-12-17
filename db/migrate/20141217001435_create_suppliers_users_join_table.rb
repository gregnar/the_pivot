class CreateSuppliersUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :suppliers
  end
end
