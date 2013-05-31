class Admin::DiscussionsController < Admin::BaseController
  def index
    @discussions = Discussion.all
  end

  def show
    
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
      redirect_to admin_discussions_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
  end

  def destory
    
  end
end
