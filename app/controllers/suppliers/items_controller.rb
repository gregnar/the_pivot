class Suppliers::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_supplier_admin, only: [:edit, :new, :create, :destroy]
  before_action :set_slug, only: [:edit, :new, :create, :update, :destroy]

  def index
    @search = current_supplier.items.search(params[:q])
    @items = @search.result
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
    @categories = current_supplier.categories
  end

  def create
    @item = Item.new(item_params)
    @item.supplier = current_supplier
    if @item.save!
      redirect_to supplier_items_path, notice: 'Item successfully created!'
    else
      flash.now[:notice] = 'Item could not be created, try again.'
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to supplier_item_path(@item, slug: @slug), notice: 'Item was successfully updated.'
    else
      redirect_to edit_supplier_item_path(@item, slug: @slug), notice: 'Unable to edit item. Try again.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, category_ids: [])
  end

  def set_item
    @item = current_supplier.items.find(params[:id])
  end

  def set_slug
    @slug = current_supplier.slug
  end
end
