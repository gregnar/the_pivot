class AddPasswordSecurityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmed, :boolean
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
  end
end
