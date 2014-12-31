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

  def edit
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
