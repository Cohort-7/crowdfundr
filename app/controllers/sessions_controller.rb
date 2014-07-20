class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "You are now logged in as #{user.first_name} #{user.last_name}"
    else
      flash.now[:error] = "Invalid user name or password..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to categories_url, notice: "Logged out!"
  end
end
