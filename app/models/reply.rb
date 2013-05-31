class Reply < ActiveRecord::Base
  attr_accessible :post, :topic_id, :user_id
  belongs_to :topic
  belongs_to :user
end
