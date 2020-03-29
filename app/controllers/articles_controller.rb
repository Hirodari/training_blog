class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    byebug
    @article = Article.new(article_params)
    #@article = User.first
    if @article.save
      flash[:success] = "Article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:info] = "Article was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article destroyed"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :author, :User)
    end

    def find_article
      @article = Article.find(params[:id])
    end



end
