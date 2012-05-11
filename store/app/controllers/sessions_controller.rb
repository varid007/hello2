class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user.id), :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password" 
      redirect_to home_index_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to home_index_path, :notice => "Logged out!"
  end  
end
