class CommentsController < ApplicationController
  def new
    @comment=Comment.new
    redirect_to :controller => :articles, :action => :show
  end 
  
  def create
    @comment = Comment.new(params[:comment]) 
   # @article = Article.find_by_id(params[:comment])
    if @comment.save
      flash[:notice]= "Comment posted"
      redirect_to articles_path
    end
     
  end
end
