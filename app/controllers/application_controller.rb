class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user, :user_signed_in?

  def authenticate_user!
    redirect_to '/auth/google_oauth2' unless user_signed_in?
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end
end
