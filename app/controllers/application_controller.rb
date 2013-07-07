class ApplicationController < ActionController::Base
  respond_to :html, :js
  responders :flash
  protect_from_forgery
  before_filter :authenticate_user!
  around_filter :scope_current_tenant

  helper_method :current_user, :current_users, :user_signed_in?

  private
  def authenticate_user!
    unless user_signed_in?
      session[:return_to] = request.path
      redirect_to '/auth/google_apps'
    end
  end

  def current_user
    @current_user ||= User.unscoped.find_by_id(session[:user_id]) if user_signed_in?
  end

  def current_users
    User.scoped.decorate
  end

  def user_signed_in?
    session[:user_id] && User.unscoped.find_by_id(session[:user_id])
  end

  def current_tenant
    current_user.tenant
  end
  helper_method :current_tenant

  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end
end
