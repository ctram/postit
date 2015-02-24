class VotesController < ApplicationController
  def up_vote_post
    @post = Post.find(params[:id])
    @posts = Post.all
    @vote = Vote.new(vote:true, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)

    user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if user_net_votes + 1 <= 1
      @post.votes << @vote
      redirect_to posts_path
    else
      flash[:error] = "You cannot up vote this item anymore. You can still down vote, though."
      render '/posts/index'
    end
  end

  def down_vote_post
    @post = Post.find(params[:id])
    @posts = Post.all
    @vote = Vote.new(vote:false, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)

    user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if user_net_votes - 1 >=  -1
      @post.votes << @vote
      redirect_to posts_path
    else
      flash[:error] = "You cannot down vote this item anymore. You can still up vote, though."
      render '/posts/index'
    end
  end

end
