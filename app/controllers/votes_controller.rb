class VotesController < ApplicationController
  def up_vote_post
    @post = Post.find(params[:id])
    @vote = Vote.new(vote:true, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)
    @post.votes << @vote
    redirect_to posts_path
  end

  def down_vote_post
    @post = Post.find(params[:id])
    @vote = Vote.new(vote:false, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)
    @post.votes << @vote
    redirect_to posts_path
  end

end
