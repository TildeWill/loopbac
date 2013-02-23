class ApplicationController < ActionController::Base
  responders :flash
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user, :user_signed_in?, :current_contacts

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

  def current_contacts
    contacts = Google::Contact.get_all(
        current_user.domain,
        current_user.oauth2_token,
        current_user.refresh_token) do |new_token|
      current_user.update_attributes(:oauth2_token => new_token)
    end
    @contacts = Google::ContactDecorator.decorate_collection(contacts)
  end
end
