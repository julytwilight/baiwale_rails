class DiscussionsController < ApplicationController

  def index
    @discussions = Discussion.all
    @topics = Topic.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @discussions = Discussion.all
    @discussion = Discussion.find_by_name(params[:id])
    @topics = @discussion.topics.paginate(page: params[:page], :per_page => 30)
  end
  
  def edit

  end

end