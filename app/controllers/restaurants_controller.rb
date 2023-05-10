class RestaurantsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:new, :create]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Ресторан успешно добавлен!"
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end
