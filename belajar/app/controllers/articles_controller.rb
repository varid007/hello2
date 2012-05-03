class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end  
  
  def create
    @article = Article.new(params[:article])
    if @article.save
    
    redirect_to articles_path
    else
    render :new
    end
  end 
  
  def new
    @article = Article.new
    
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def show
    @article = Article.find_by_id(params[:id])
  
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
    
       redirect_to articles_path
       else
       flash[:notice] = 'User was Error.'
       render :edit
    end
    
  end
  
  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
end
