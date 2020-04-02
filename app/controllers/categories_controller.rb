class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :show]
  before_action :require_admin, except: [:index, :show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        flash[:success] = "#{@category.name} Category created! "
        redirect_to categories_path
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.name} Updated!"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def show
  end


  private
    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find(params[:id])
    end


    def require_admin
      if !logged_in? || (logged_in? && !current_user.admin?)
        flash[:danger] = "Only admins can perform this action"
        redirect_to categories_path
      end
    end

end
