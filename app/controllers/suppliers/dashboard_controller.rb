class Suppliers::DashboardController < ApplicationController
  before_action :require_user_to_be_supplier_admin
  def index
    @supplier = current_user.supplier
  end
end
