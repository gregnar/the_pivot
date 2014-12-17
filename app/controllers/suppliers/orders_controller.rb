class Suppliers::OrdersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]
  before_action :current_user, only: [:show, :edit, :update]



  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
    @order.user = @current_user
    @order.pending = true
    @order.items = @cart.order_items
    @order.address = nil unless @order.delivery
    if @order.save
      session[:cart] = nil
      session[:order] = @order.id
      redirect_to new_charge_path
    else
      flash[:notice] = 'Order could not be created. Try checking out again.'
      redirect_to cart_items_path
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def order_params
    params.require(:order).permit(:delivery, :user, :address_id)
  end
end
