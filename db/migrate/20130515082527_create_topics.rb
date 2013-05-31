class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :discussion_id
      t.integer :user_id
      t.string :title
      t.text :post
      t.integer :views_count
      t.integer :replies_count
      t.integer :votes_count
      t.integer :last_replay_user_id

      t.timestamps
    end
  end

  add_column :users, :avatar, :string, :default => ''
end
