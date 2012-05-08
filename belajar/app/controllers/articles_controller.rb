class ArticlesController < ApplicationController

  before_filter :require_login, :only => [:new,:edit, :delete, :update,:destroy]
  before_filter :find_article, :only => [:show, :edit, :delete, :update,:destroy]
  before_filter :your_article, :only => [:edit, :delete, :update,:destroy]
  
  def index
    @articles = Article.all
  end  
  
  def create
    
    @article=Article.new(params[:article])
    
    if @article.save
    flash[:notice] = 'Article was succesful create' 
    redirect_to articles_path
    else
    flash[:error] = 'Article was Error'
    render :new
    end
  end 
  
  def new
    @article = Article.new
   
    
  end
  
  def edit
    
  end
  
  def show
    @comments=@article.comments
    @comment=@article.comments.new
  end
  
  def update
    if @article.update_attributes(params[:article])
       flash[:notice] = 'Article was succesful Update' 
       redirect_to articles_path
       else
       
       render :edit
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def find_article
    @article = Article.find_by_id(params[:id])
    if @article.nil?
      flash[:notice] = 'Article not found'
      redirect_to articles_path
    end
  end
  
  def your_article
    user=User.find_by_email(current_user.email)
    unless @article.user_id == user.id || is_admin
       flash[:notice]="its not your article"
       redirect_to articles_path
      
    end
  end
end
