class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        set_article#@article = Article.find(params[:id])
    end

    def update
        set_article # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Updated!"
            redirect_to article_path(@article)
        else
            render "edit"
        end
    end

    def create
         @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Success!"
            redirect_to article_path(@article)
        else 
            render 'new'
        end
        # @article.save
        # redirect_to article_path(@article)
    end

    def show
        set_article # @article = Article.find(params[:id])
    end

    def destroy
        set_article #@article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article deleted"
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
