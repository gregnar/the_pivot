class Suppliers::CategoriesController < ApplicationController

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
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to supplier_category_path(@category)
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
