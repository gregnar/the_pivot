class ItemsController < ApplicationController

  def index
    @search = Item.search(params[:q])
    @items = @search.result.shuffle
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, :category_ids)
  end

end
