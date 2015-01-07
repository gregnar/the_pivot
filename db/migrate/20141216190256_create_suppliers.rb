class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :description
      t.integer :address_id

      t.timestamps
    end
  end
end
