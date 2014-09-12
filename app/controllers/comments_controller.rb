class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    @user = User.find(current_user)
    @story = Story.find(params[:story_id])
  end

  def new
    @story = Story.find(params[:story_id])
    @comment = Comment.new
    @user = User.find(current_user)
  end

  def create
    @user = User.find(current_user)
    @story = Story.find(params[:story_id])
    @comment = Comment.create(comment_params)
    if @comment.valid?
      flash[:notice] = "Your comment has been added."
      redirect_to story_comments_path(@story.id)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :story_id)
  end
end
