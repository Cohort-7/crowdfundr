class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "You are now logged in as #{user.first_name} #{user.last_name}"
    else
      flash[alert] = "You were not logged in"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root, notice: "Logged out!"
  end
end
