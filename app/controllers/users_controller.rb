class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]
  before_action :current_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new_user_type
  end

  def new
    @user = User.new
    @supplier = params[:supplier]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User created.'
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
      if @user.update(user_params)
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
    binding.pry
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :display_name)
  end
end
