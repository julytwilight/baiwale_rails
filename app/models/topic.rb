class Topic < ActiveRecord::Base
  attr_accessible :discussion_id, :last_replay_user_id, :post, :replies_count, :title, :user_id,
                  :views_count, :votes_count, :last_reply

  before_create :set_default_value

  belongs_to :user
  belongs_to :discussion

  has_many :replies, dependent: :destroy

  default_scope order: 'topics.last_reply DESC'

  def set_default_value
    self.last_reply = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end
