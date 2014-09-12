class StoriesController < ApplicationController

  def index
    @stories = Story.all
    @user = User.find(params[:user_id])
  end

  def new
    @story = Story.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @story = Story.create(story_params)
    if @story.valid?
      flash[:notice] = "Your story has been added."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :content, :user_id)
  end

end
