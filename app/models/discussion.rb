class Discussion < ActiveRecord::Base
  attr_accessible :title, :name, :summary

  has_many :topics, dependent: :destroy
  
  default_scope order: 'discussions.topics_count DESC'
end
