class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user

  private

  def logged_in_user
    @logged_in_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end
end

