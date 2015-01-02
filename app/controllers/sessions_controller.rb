class SessionsController < ApplicationController
  def new
    session[:supplier] = true if params[:supplier]
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      if session[:supplier]
        redirect_to new_supplier_path, notice: "Welcome back, #{user.name}. Create your supplier:"
        session.delete(:supplier)
      else
        redirect_to user_path(user), notice: "Welcome to AIRLIFT, #{user.name}."
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
