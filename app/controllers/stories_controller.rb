class StoriesController < ApplicationController

  def index
    if params[:user_id] == nil
    @stories = Story.all
    render('stories/all_index.html.erb')
    else
    # @stories = Story.all
    # @stories.each do |story|
    #   @user = Story.find(story.user_id)
    # end
    @user = User.find(params[:user_id])
    end
  end

  def new
    @story = Story.new
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(current_user)
    @story = Story.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @story = Story.create(story_params)
    if @story.valid?
      flash[:notice] = "Your story has been added."
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @user = User.find(current_user)
    if @story.update(story_params)
    flash[:notice] = "Your story has been updated"
    redirect_to root_path
    else
      redirect_to edit_user_story_path({:user_id => @user.id, :id => @story.id})
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Your story has been deleted"
    redirect_to root_path
  end


  private
  def story_params
    params.require(:story).permit(:title, :content, :user_id)
  end

end
