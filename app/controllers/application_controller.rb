class ApplicationController < ActionController::Base
  responders :flash
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user, :user_signed_in?, :current_users

  def authenticate_user!
    redirect_to '/auth/google_apps' unless user_signed_in?
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def current_users
    users = Google::User.all(current_user.domain)
    Google::UserDecorator.decorate_collection(users)
  end
end
