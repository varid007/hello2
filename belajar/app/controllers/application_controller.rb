class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  def require_login
    if current_user.nil?
      flash[:error] = "You are not permited, please login first"
      redirect_to new_session_path
    else 
      return current_user
    end
  end
  
  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  
  
   rescue_from NoMethodError, :with => :record_not_found

 
   def record_not_found
    render "/public/500.html", :status => 500, :layout => false
   end
end
