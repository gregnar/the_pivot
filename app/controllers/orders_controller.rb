class OrdersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]
  before_action :current_user, only: [:show, :edit, :update]

  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    if current_user
      @order = Order.new
      @cart_items = @cart.items
    else
      flash[:notice] = 'You need to be logged in to checkout.'
      redirect_to login_path
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.pending = true
    @order.items = @cart.order_items
    @order.coordinate = nil unless @order.delivery
    attempt_create_order
  end

  private

  def correct_user
    order = Order.find(params[:id])
    redirect_to(root_url) unless current_user.orders.include?(order)
  end

  def order_params
    params.require(:order).permit(:coordinate_id, coordinate_attributes: [:id, :latitude, :longitude, :_destroy])
    params.require(:order).permit(:delivery, :coordinate_id, coordinate_attributes: [:id, :latitude, :longitude, :_destroy])
  end

  def attempt_create_order
    if @order.save!
      session[:cart] = nil
      session[:order] = @order.id
      redirect_to new_charge_path
    else
      flash[:notice] = 'Order could not be completed. Try checking out again.'
      redirect_to cart_items_path
    end
  end
end
