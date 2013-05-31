class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string, :limit => 25
    add_index  :users, :remember_token
  end
end
