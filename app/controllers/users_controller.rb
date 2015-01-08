class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]
  before_action :current_user, only: [:show, :edit, :update]
  before_action :reset_session_supplier_key, only: [:new]

  def index
    @users = User.all
  end

  def account_confirmation
    @user = User.find_by(password_reset_token: params[:tkn])
    if(@user)
      @user.update(email_confirmed: true, password_reset_token: nil)
      redirect_to login_path, :notice => "Account confirmed!"
    else
      redirect_to login_path, :notice => "Uh oh! There's a problem with confirming your account..."
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # @user.send_confirmation
      session[:user_id]  = @user.id
      session[:supplier] ? redirect_to(new_supplier_path) : redirect_to(root_path, notice: 'User created.')
      session.delete(:supplier)
    else
      flash.now[:notice] = 'User could not be created.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'User was deleted.' }
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :display_name)
  end
end
