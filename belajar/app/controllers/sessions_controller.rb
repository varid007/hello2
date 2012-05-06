class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to articles_path :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password" 
      render "new"
    end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to new_session_path :notice => "logged out !"
  
  end
end
