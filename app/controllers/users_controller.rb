require 'pry'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)

    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = 'Passwords do not match.'
      render :new
    else
      if @user.save
        flash[:notice] = 'You\'ve successfully registered!'
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'You\'ve successfully updated your profile.'
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password) # note here that password is a VIRTUAL attribute, i.e. it is NOT part of your object's table, yet you still need to run it through strong parameters in order to have it work properly.
  end
end
