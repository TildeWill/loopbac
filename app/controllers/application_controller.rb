class ApplicationController < ActionController::Base
  respond_to :html
  responders :flash
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user, :user_signed_in?, :current_users

  def authenticate_user!
    unless user_signed_in?
      session[:return_to] = request.path
      redirect_to '/auth/google_apps'
    end
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def current_users
    User.scoped.decorate
  end
end
