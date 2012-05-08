class Admin::CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment]) 
    @article = Article.find_by_id(params[:comment][:article_id])
    @comments=@article.comment
    if @comment.save
      flash[:notice]= "Comment posted"
      #di bawah direct di ganti
      redirect_to article_path(@article)
    end
   

  end
end
