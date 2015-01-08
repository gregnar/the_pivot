class Suppliers::CategoriesController < ApplicationController
  before_action :set_slug, only: [:edit, :update, :destroy, :new, :create]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.supplier = current_supplier
    if @category.save!
      redirect_to supplier_categories_path(slug: @slug), notice: 'Category was successfully created.'
    else
      flash.now[:notice] = 'Category could not be created, try again.'
      render :new
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
    if @category.update_attributes(category_params)
      redirect_to supplier_categories_path(@category, slug: @slug), notice: 'Category was successfully updated.'
    else
      redirect_to edit_supplier_category_path(@category, slug: @slug), notice: 'Unable to edit category. Please try again.'
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.delete if category
    redirect_to categories_path
  end

  # def destroy
  #   if @category.destroy
  #     redirect_to supplier_categories_path(@category, slug: @slug), notice: 'Category was successfully deleted.'
  #   else
  #     redirect_to supplier_categories_path(@category, slug: @slug)
  #   end
  # end

  private

  def set_slug
    @slug = params[:slug]
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
