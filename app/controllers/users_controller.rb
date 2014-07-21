class UsersController < ApplicationController
  before_action :load_current_user, only: [:edit, :update, :destroy]

  # before_action :authenticate_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:alert] = "New user was not saved..."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    unless @user
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Changes saved"
    else
      flash.now[:alert] = "Your changes were not saved..."
      render :edit
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
