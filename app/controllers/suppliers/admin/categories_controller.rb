class Admin::CategoriesController < Admin::BaseAdminContoller

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else render :new
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def update
    @category = Category.find(params[:id])
    @category.update(correct_params)
    redirect_to category_path(@category)
  end

  def destroy
    category = Category.find(params[:id])
    category.delete if category
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
