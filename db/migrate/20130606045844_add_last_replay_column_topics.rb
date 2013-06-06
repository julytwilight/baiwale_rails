class AddLastReplayColumnTopics < ActiveRecord::Migration
  def change
    add_column :topics, :last_reply, :datetime
  end
end
