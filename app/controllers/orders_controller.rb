class OrdersController < ApplicationController
  before_action :redirect_unless_user_owns_order, except: [:index, :new, :create]
  before_action :current_user, except: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    if current_user
      @order = Order.new
      @cart_items = @cart.items
    else
      flash[:notice] = 'You need to be logged in to checkout.'
      redirect_to login_path(checkout: true)
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.item_orders = @cart.bought_items(@order)
    attempt_create_order ? OrderMailer.order_confirmation(@order).deliver : flash[:error] = 'Error placing order...'
  end

  def update
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def redirect_unless_user_owns_order
    order = Order.find(params[:id])
    redirect_to(root_url) unless current_user.orders.include?(order)
  end

  def order_params
    params.require(:order).permit(coordinate_attributes: [:latitude, :longitude])
  end

  def attempt_create_order
    if @order.save!
      session[:cart]  = nil
      session[:order] = @order.id
      redirect_to new_charge_path
      return true
    else
      flash[:notice] = 'Order could not be completed. Try checking out again.'
      redirect_to cart_items_path
      return false
    end
  end

end
