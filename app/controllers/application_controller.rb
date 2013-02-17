class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!

  helper_method :current_user, :user_signed_in?

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session[:user_id]
  end
end
