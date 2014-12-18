class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    
  end
end
