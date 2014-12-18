class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to new_user_path(supplier: @supplier), notice: "You're not finished!"
    else
      redirect_to root_path
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone, :fax, :description)
  end
end
