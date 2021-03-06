class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :reload_rails_admin, if: :rails_admin_path?

  include SessionsHelper

  helper_method :current_user,
                :require_admin,
                :current_supplier,
                :current_supplier_admin?,
                :require_supplier_admin,
                :reset_session_supplier_key

  before_action :load_cart

  include ActionView::Helpers::TextHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_supplier
    @current_supplier ||= Supplier.find_by(slug: params[:slug])
  end

  def current_supplier_admin?
    current_user && current_user.supplier == current_supplier
  end

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: 'Not authorized.'
    end
  end

  def require_supplier_admin
    unless current_supplier_admin?
      redirect_to root_path, notice: 'Not authorized.'
    end
  end

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  def reset_session_supplier_key
    # ensures that login and users#create redirect to suppliers#create only when appropriate
    session.delete(:supplier)
    session[:supplier] = true if params[:supplier]
  end

  private

  def reload_rails_admin
    models = %W(User UserProfile)
    models.each do |m|
      RailsAdmin::Config.reset_model(m)
    end
    RailsAdmin::Config::Actions.reset

    load("#{Rails.root}/config/initializers/rails_admin.rb")
  end

  def rails_admin_path?
    controller_path =~ /rails_admin/ && Rails.env == "development"
  end
end
