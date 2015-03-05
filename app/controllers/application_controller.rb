class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      # memoization - this saves the returned value of current_user() for the current request. Thereforew, if current_user() is called many times in a page, it will only run current_user() once and save the value in memory. current_user() is still ran each time there is a new request.
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'You must be logged in to do that.'
      redirect_to posts_path
    end
  end

  # Require that the current user must match the edit_user pages, i.e. restrict access to pages that can change the data of other users.
  def require_user_access_personal
    if current_user != User.find_by(slug: params[:id])
      flash[:error] = 'You must be logged in as that user in order to access that page.'
      redirect_to posts_path
    end
  end
end
