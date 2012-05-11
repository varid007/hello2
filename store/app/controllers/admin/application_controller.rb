class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  helper_method :current_user
  
  def require_admin_login
    if current_user.nil? || !current_user.is_admin
       flash[:error] = "Only admin are permitted"
       redirect_to articles_path
    else
       return current_user
    end
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  
end


