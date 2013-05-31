class AddPointsTopics < ActiveRecord::Migration
  def change
    add_column :topics, :points, :integer, :default => 0, :null => false
  end
end
