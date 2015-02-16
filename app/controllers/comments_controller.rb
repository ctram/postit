# require 'pry'

class CommentsController < ApplicationController
  before_action :require_user
  before_action :require_user_access_personal

  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user_id = current_user.id
    @comment.post = Post.find(params[:post_id] )
    @comments = Comment.all
    @post = Post.find(params[:post_id])
    binding.pry

    if @comment.save
      flash[:notice] = 'Comment saved'
      redirect_to post_path(@post)
    else
      # binding.pry
      render 'posts/show'
    end
  end

end
