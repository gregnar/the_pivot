class SessionsController < ApplicationController
  before_action :reset_session_supplier_key, only: [:new]

  def new
    @user = User.new
  end

  def create
    user = User.authenticate_user(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      if session[:supplier]
        redirect_to new_supplier_path, notice: "Welcome back, #{user.name}. Become a supplier:"
        session.delete(:supplier)
      else
        redirect_to user_path(user), notice: "Welcome back, #{user.name}."
      end
    else
      redirect_to login_path, notice: 'We could not log you in. Please try again.'
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'You are logged out.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :display_name)
  end
end
