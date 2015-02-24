require 'pry'

class UsersController < ApplicationController
  before_action :require_user_access_personal, only:[:edit, :update]

  def new
    @user = User.new
    @title = 'Register'
  end

  def show
    # XXX: changed params[:user_id] to params[:id] -- something might break!!!
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = 'Passwords do not match.'
      render :new
    else
      if @user.save
        flash[:notice] = 'You\'ve successfully registered and are now logged in!!'
        session[:user_id] = @user.id
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = 'Edit profile'
  end

  def update
    @user = User.find(params[:id])
    # if params[:user][:password_confirmation] != params[:user][:password]
    #   flash[:notice] = 'Your password and password confirmation must match.'
    #   render :edit
    # else
      if @user.update(user_params)
        flash[:notice] = 'You\'ve successfully updated your profile.'
        redirect_to user_path(@user)
      else
        render :edit
      end
    # end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :time_zone) # note here that password is a VIRTUAL attribute, i.e. it is NOT part of your object's table, yet you still need to run it through strong parameters in order to have it work properly.
  end
end
