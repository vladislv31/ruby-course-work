class AdminController < ApplicationController
  before_action :require_admin

  def index
  end

  private

  def require_admin
    unless current_user && current_user.is_admin?
      flash[:danger] = 'У вас нет прав для просмотра этой страницы'
      redirect_to root_path
    end
  end
end
