class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.send_password_reset
      flash[:notice] = "Email has been sent with reset password instructions"
    else
      flash[:error] = "No account associated with that email on file."
    end
  end

  def edit
    @user = User.find(password_reset_token: params[:id])
  end

  def update
    @user = User.find(password_reset_token: params[:id])
    if @user.password_reset_sent_at > 2.hours.ago
      redirect_to login_path, notice: "Password reset has expired."
    elsif @user.update(reset_params)
      @user.update(password_reset_token: nil)
      redirect_to login_path, notice: "Password has been reset."
    else
      redirect_to root_path, notice: "THe programmer who made this is flawed and stupid. Sorry!"
    end
  end

  private

  def reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
