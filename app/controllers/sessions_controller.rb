class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :create
  skip_filter :scope_current_tenant, only: :create

  def create
    auth = request.env["omniauth.auth"]
    user = User.unscoped.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    ensure_all_domain_users_exists

    redirect_to(session.delete(:return_to) || root_url, :notice => "Signed in!")
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url(host: request.domain), :notice => "Signed out!"
  end

  private

  def ensure_all_domain_users_exists
    users = Google::User.all(current_user.domain)

    users.each do |user|
      User.where(email: user.email).first_or_create(
        first_name: user.first_name,
        last_name: user.last_name,
        name: user.name,
        email: user.email,
        tenant_id: Tenant.current_id,
        admin: user.admin?
      )
    end
  end
end
