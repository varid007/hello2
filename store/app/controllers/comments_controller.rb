class CommentsController < ApplicationController

 def create
   @user = current_user
   @comment = @user.comments.new(params[:comment]) 
   @article = Article.find_by_id(params[:comment][:article_id])
   @comments=@article.comments
   
    respond_to do |format|
      if @comment.save
    
        format.html { redirect_to(article_path(article), :notice => 'Comment was successfully created.') }
        format.js
      end
    end
  end

 def comments

 end
end
