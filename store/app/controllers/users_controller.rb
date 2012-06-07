class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update,:destroy]
  before_filter :your_acount, :only => [:edit, :update,:destroy]
 
  def index
    @users = User.all
  end
  
   def new 
    @user = User.new 
  end 
  
  def show
  end
  
  def create 
    @user = User.new(params[:user]) 
    if verify_recaptcha
      if @user.save 
       
        flash[:notice] = 'Account was Created, Log in ?' 
        redirect_to home_index_path, :notice => "Signed up!" 
      else 
        render :new 
      end 
    else
      flash[:error]= "There was an error with the recaptcha code"
      render :new
    end
  end 
  def edit
  end
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was succesful Update' 
      redirect_to user_path
    else
      flash[:notice] = 'User faild Update' 
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice]="user has deleted"
    redirect_to users_path
  end
  private
  def find_user
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:notice] = 'User not found'
      redirect_to users_path
    end
  end
  
  def your_acount
    user=User.find_by_email(current_user.email)
    unless @user.id == user.id || current_user.is_admin
       flash[:notice]="its not your Acount"
       redirect_to users_path
    end
  end
end
