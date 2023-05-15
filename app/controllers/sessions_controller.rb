class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.is_admin?
      #   redirect_to admin_path
      # else
        redirect_to root_path, notice: "Welcome back, #{user.name}!"
      end
    else
      flash.now[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out."
  end
end
