class ArticlesController < ApplicationController
    load_and_authorize_resource
    def index
        @articles = @articles.paginate(page: params[:page], per_page: 5)
    end

    def new; end

    def edit; end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show
        @comments = @article.comments
        @comment = Comment.new
    end

    def destroy
        @article.destroy
        flash[:success] = "Article was successfully deleted"
        redirect_to articles_path
    end

    def test_2
        @articles = @articles.paginate(page: params[:page], per_page: 5)
    end
    private

    def article_params
        params.require(:article).permit(:title, :description)        
    end
end