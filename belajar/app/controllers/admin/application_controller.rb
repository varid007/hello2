class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  
  helper_method :current_user
  
  def require_admin_login
    if current_user.nil? || !is_admin
       flash[:error] = "Only admins are permitted"
       redirect_to articles_path
    else
       return current_user
    end
  end
  
  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if  
      session[:user_id]  
  end  
  
  def is_admin
    if current_user.email == "sadewa44@gmail.com"
      true
    else
      false
    end
  end
end
