class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    session[:logged_in] = true if request.env['omniauth.auth']['info']['email']
    session[:username] = request.env['omniauth.auth']['info']['name']
    #User.create_or_update_from_google_data(google_api_interface)
    redirect_to root_path
  end

  def failure
    flash[:notice] = params[:message]
    redirect_to root_path
  end

  def destroy
    session[:logged_in] = false
  end
end