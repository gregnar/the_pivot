class CartItemsController < ApplicationController

  def cart_status
    @cart.add_item(OpenStruct.new(:id => 5))
    render :text => "#{session[:cart].inspect} ; #{@cart.data.object_id} ; #{session[:cart].object_id}"
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    session[:cart] = @cart.data
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item), item.title)} in your cart."
    redirect_to supplier_items_path(slug: params[:slug])
  end

  def index
    @cart_items = @cart.items
  end

  def plus
    item = Item.find_by(id: params["item"].to_i)
    @cart.add_item(item)
    redirect_to cart_items_path
  end

  def minus
    item = Item.find_by(id: params["item"].to_i)
    @cart.remove_item(item)
    redirect_to cart_items_path
  end
end
