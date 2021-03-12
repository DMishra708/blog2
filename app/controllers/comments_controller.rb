class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:article_id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
