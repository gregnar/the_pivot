class Suppliers::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_supplier_admin, only: [:edit, :new, :create, :destroy]

  def index
    @search = current_supplier.items.search(params[:q])
    @items = @search.result
  end

  def show
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = current_supplier.categories
    @slug = params[:slug]
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to supplier_items_path, notice: 'Item successfully created!'
    else
      flash.now[:notice] = 'Item could not be created, try again.'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
