class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.with_items
  end

  def new
    if !current_user
      redirect_to new_user_path(supplier: true)
    elsif current_user.supplier_admin
      redirect_to user_path(current_user), notice: "Your account may be associated with only one supplier."
    else
      @supplier = Supplier.new
    end
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
