class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :set_article
    def new
        @comment = Comment.new
    end

    def show

    end

    def create
        @comment = @article.comments.new(comment_params)
        if @comment.save
            redirect_to article_path(@article)
        else
            raise "error"
        end
    end

    def destroy
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        flash[:success] = "Comment was successfully deleted"
        redirect_to article_path(@comment.article)
    end
    private

    def set_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end