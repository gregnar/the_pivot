class Suppliers::OrdersController < ApplicationController
  before_action :require_user_to_be_supplier_admin, only: [:show, :edit, :update, :destroy, :pay, :cancel]
  before_action :current_user, only: [:show, :edit, :update]
  before_action :set_order, only: [:pay, :cancel, :show]
  before_action :set_slug, only: [:pay, :cancel]

  def index
    @orders = current_supplier.unique_orders
  end

  def show
  end

  def pay
    @order.pay
    if @order.save
      redirect_to supplier_orders_path(slug: @slug), notice: "Order marked as paid."
    else
      redirect_to supplier_orders_path(slug: @slug), notice: "Failed to mark order as paid."
    end
  end

  def cancel
    @order.cancel_supplier_items(current_supplier)
    if @order.save
      delete_if_without_items
      redirect_to supplier_orders_path(slug: @slug), notice: "Order cancelled."
    else
      redirect_to supplier_orders_path(slug: @slug), notice: "Failed to cancel order."
    end
  end

  private

  def delete_if_without_items
    Order.delete(@order) if @order.items.count == 0
  end

  def set_order
    @order = current_supplier.orders.find(params[:id])
  end

  def set_slug
    @slug = params[:slug]
  end

end
