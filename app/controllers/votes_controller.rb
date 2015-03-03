class VotesController < ApplicationController
  before_action :require_user

  def up_vote_post
    @post = Post.find(params[:id])
    @posts = Post.all
    @vote = Vote.new(vote:true, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)
    @user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if @user_net_votes + 1 <= 1

      @post.votes << @vote
      respond_to do |format|
        format.html do
          redirect_to posts_path
        end# takes a block
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "You cannot up vote this item anymore. You can still down vote, though."
          render '/posts/index'
        end
        format.js
      end

# TODO: Prevent User from voting more than once, up or down.
    end
  end

  def down_vote_post
    @post = Post.find(params[:id])
    @posts = Post.all
    @vote = Vote.new(vote:false, user_id: session[:user_id], voteable_type:'Post', voteable_id: @post.id)

    @user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if @user_net_votes - 1 >= -1

      @post.votes << @vote
      respond_to do |format|
        format.html do
          redirect_to posts_path
        end# takes a block
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "You cannot down vote this item anymore. You can still up vote, though."
          render '/posts/index'
        end
        format.js
      end
    end
  end

  def up_vote_comment
    @comment = Comment.find(params[:id])
    @comments = Comment.all
    @post = Post.find(@comment.post.id)
    @vote = Vote.new(vote:true, user_id: session[:user_id], voteable_type:'comment', voteable_id: @comment.id)

    @user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if @user_net_votes + 1 <= 1
      @comment.votes << @vote
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def down_vote_comment
    @comment = Comment.find(params[:id])
    @comments = Comment.all
    @vote = Vote.new(vote:false, user_id: session[:user_id], voteable_type:'comment', voteable_id: @comment.id)

    @user_net_votes = Vote.sum_votes_by_user_by_voteable_id @vote.voteable_id, User.find(session[:user_id])

    if @user_net_votes -1 >= -1
      @comment.votes << @vote
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

end
