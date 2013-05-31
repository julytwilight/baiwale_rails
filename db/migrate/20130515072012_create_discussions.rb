class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string  :title,          :null => false
      t.string  :name,           :null => false
      t.string  :summary,        :default => ''
      t.integer :topics_count,   :default => 0

      t.timestamps
    end
  
    add_column :users, :admin, :integer
    add_index :discussions, :title, unique: true # 添加索引
    add_index :discussions, :name, unique: true # 添加索引
  end
end
