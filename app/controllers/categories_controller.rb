class CategoriesController < ApplicationController

  def index
    @categories = Category.select(:name).distinct.to_a
  end

  def category
    @category = Category.find(params[:id])
  end

end
