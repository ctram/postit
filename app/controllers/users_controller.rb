
class UsersController < ApplicationController
  before_action :require_user_access_personal, only:[:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    @title = 'Register'
  end

  def show
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
    @title = 'Edit profile'
  end

  def update
      if @user.update(user_params)
        flash[:notice] = 'You\'ve successfully updated your profile.'
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :time_zone) # note here that password is a VIRTUAL attribute, i.e. it is NOT part of your object's table, yet you still need to run it through strong parameters in order to have it work properly.
  end

  def set_user
    @user = User.find_by(slug: params[:id])
  end
end
