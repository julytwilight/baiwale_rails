class Topic < ActiveRecord::Base
  attr_accessible :discussion_id, :last_replay_user_id, :post, :replies_count, :title, :user_id, :views_count, :votes_count

    belongs_to :user
    belongs_to :discussion

    has_many :replies, dependent: :destroy

    default_scope order: 'topics.updated_at DESC'
end
