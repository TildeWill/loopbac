module ApplicationHelper
  def user_logged_in?
    !!session[:logged_in]
  end
end
