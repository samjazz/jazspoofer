class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	current_user
  end

  def admin?
  	logged_in? && current_user.is_admin
  end

  helper_method :current_user, :logged_in?, :admin?
end
