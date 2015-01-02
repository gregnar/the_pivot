class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.with_items
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.users << current_user
    if @supplier.save
      redirect_to root_path
    else
      flash.now[:notice] = "Supplier could not be created."
      render :new
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone, :fax, :description)
  end
end
