class Admin::BaseAdminController < ApplicationController
  before_action :require_supplier_admin
end
