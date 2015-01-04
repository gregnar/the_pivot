class Suppliers::DashboardController < ApplicationController
  before_action :require_supplier_admin
  def index
    @supplier = current_user.supplier
  end
end
