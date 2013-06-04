class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email,           :null => false, :limit => 90
      t.string  :username,        :null => false, :limit => 90
      t.string  :password_digest, :null => false, :limit => 100
      t.string  :location,       :null => false, :limit => 100
      t.integer :gender,          :null => false, :default => 0
      t.integer :point,           :null => false, :default => 0
      t.integer :state,           :null => false, :default => 1
      t.integer :topics_count,    :null => false, :default => 0
      t.integer :replies_count,   :null => false, :default => 0
      t.integer :following,       :null => false, :default => 0
      t.integer :followers,       :null => false, :default => 0

      t.timestamps
    end
  
    # add_column :users, :password_digest, :string 添加字段
    add_index :users, :email, unique: true # 添加索引
    add_index :users, :username, unique: true # 添加索引
  end
end
