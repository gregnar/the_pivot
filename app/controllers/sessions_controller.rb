class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome to AIRLIFT, #{user.name}."
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
