class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @search = Item.search(params[:q])
    @items = @search.result.shuffle
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
