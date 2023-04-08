class RestaurantsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    puts @restaurant
    if @restaurant.save
      flash[:success] = "Ресторан успешно добавлен!"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end
