class SessionsController < ApplicationController
  def new
    @title = 'Login'
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id # Pass a user_id into session. Do not pass the user object as there is a size limit to the cookie that session gives you.
      flash[:notice] = "You've successfully logged in."
      redirect_to root_path
    else
      flash[:error] = 'There was something wrong with your username or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've successfully logged out."
    redirect_to root_path
  end

end
