class ChangeLocationToUser < ActiveRecord::Migration
  def change
    change_column :users, :localtion, :string, :null => false, :limit => 100, :default => ''
  end
end
