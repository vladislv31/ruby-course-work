class ProductsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.build(product_params)
  
    if @product.save
      redirect_to @restaurant, notice: "Продукт успешно создан"
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])

    puts '========'
    puts @product
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
  
    if @product.update(product_params)
      redirect_to @restaurant, notice: "Продукт успешно обновлен"
    else
      render :edit
    end
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
