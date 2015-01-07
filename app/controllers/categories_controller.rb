class CategoriesController < ApplicationController

  def index
    @categories = Category.select(:name).distinct.to_a
  end

  def show
    @category = Category.find_by_slug(params[:catslug])
  end

end
