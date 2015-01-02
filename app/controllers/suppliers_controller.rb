class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.with_items
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.users << User.find(session[:user_id])
    if @supplier.save!
      @supplier.users << current_user
      redirect_to root_path
      session.delete(:supplier)
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
