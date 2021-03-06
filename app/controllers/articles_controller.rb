class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    #byebug
    @article = Article.new(article_params)
    @article.user_id = current_user.id
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
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    def find_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != (@article.user || current_user.admin?)
        flash[:danger] = "You can only edit or update your own articles"
        redirect_to root_path
      end
    end


end
