class SuppliersController < ApplicationController
  before_action :set_slug, only: [:edit, :update]
  before_action :require_supplier_admin, only: [:edit, :update]

  def index
    @suppliers = Supplier.with_items
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    if !current_user
      redirect_to new_user_path(supplier: true)
    elsif current_user.supplier_admin?
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

  def edit
    @supplier = current_user.supplier
  end

  def update
    @supplier = current_user.supplier
    respond_to do |format|
      if @supplier.update_attributes(supplier_params)
        redirect_to supplier_dashboard_path(slug: @slug), notice: 'Supplier was updated.'
      else
        redirect_to :back, notice: 'Supplier could not be updated.'
      end
    end
  end

  private

  def set_slug
    @slug = params[:slug]
  end

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone, :description)
  end
end
