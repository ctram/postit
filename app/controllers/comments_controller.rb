require 'pry'

class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user = User.first
    @comment.post = Post.find(params[:post_id] )
    @comments = Comment.all
    @post = Post.find(params[:post_id])

    if @comment.save
      flash[:notice] = 'Comment saved'
      redirect_to post_path(@post)
    else
      # binding.pry
      render 'posts/show'
    end

  end

end
