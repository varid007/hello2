class UsersController < ApplicationController
  def new 
    @user = User.new 
  end 

  def create 
    @user = User.new(params[:user]) 
    if verify_recaptcha
      if @user.save 
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = 'Account was Created, Log in ?' 
        redirect_to :controller => :sessions, :action => :new, :notice => "Signed up!" 
      else 
        render :new 
      end 
    else
      flash[:error]= "There was an error with the recaptcha code"
      render :new
    end
  end 
end
