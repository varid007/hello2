class Admin::ArticlesController < Admin::ApplicationController

  before_filter :require_admin_login, :only => [:index,:new, :create, :edit, :update, :destroy]
  before_filter :find_article,:only => [:show,:edit, :delete, :destroy]
  def index
    @articles = Article.all
  end  
  
  def create
    @article=Article.new(params[:article])
    
    if @article.save
      flash[:notice] = 'Article was succesful create' 
      redirect_to admin_articles_path
    else
      flash[:error] = 'Article was Error'
      render new_admin_articles_path
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
       redirect_to admin_articles_path
       else
       flash[:error] = "Article was failed to update"
       render :edit
    end
    
  end
  
  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end
  
  def find_article
    @article = Article.find_by_id(params[:id])
    if @article.nil?
      flash[:notice] = 'Article not found'
      redirect_to admin_articles_path
    end
  end
  
end
