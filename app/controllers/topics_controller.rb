# -*- encoding: utf-8 -*-
class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :replay]


  def new
    @topic = Topic.new
    @discussions = Discussion.all
  end

  def create
    @topic = current_user.topics.build(params[:topic])
    if @topic.save
      current_user.topics_count = current_user.topics.length
      current_user.save
      discussion = Discussion.find(@topic.discussion_id)
      discussion.topics_count = discussion.topics.length
      discussion.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @topic.views_count += 1
    @topic.save
    @replies = @topic.replies.paginate(page: params[:page], :per_page => 30)
    @reply = Reply.new
  end

  def edit
  end

  def destory
  end

  def replay
    @reply = current_user.replies.build(params[:reply])
    @reply.save
    topic = Topic.find(@reply.topic_id)
    topic.replies_count = topic.replies.length
    topic.save
    current_user.replies_count = current_user.replies.length
    current_user.save
    redirect_to topic_path(@reply.topic_id)
  end
end