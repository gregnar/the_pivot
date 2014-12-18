class Admin::SuppliersController < Admin::BaseController
  before_action :require_supplier_admin, :except => [:index]
  before_action :require_platform_admin, :only => [:index]

  def require_supplier_admin
    current_user.platform_admin? || current_user.admin_of?(@supplier)
  end
end
