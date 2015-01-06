class Suppliers::OrdersController < ApplicationController
  before_action :require_supplier_admin, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :edit, :update]

  def index
    @orders = current_supplier.unique_orders
  end

  def show
    @order = Order.find(params[:id])
  end

end
