class ApplicationController < ActionController::Base
  respond_to :html, :js
  responders :flash
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user, :current_users, :user_signed_in?

  private
  def authenticate_user!
    unless user_signed_in?
      session[:return_to] = request.path
      redirect_to '/auth/google_apps'
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def current_users
    User.scoped.decorate
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end
end
