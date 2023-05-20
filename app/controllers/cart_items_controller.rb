class CartItemsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @cart_item = current_user.cart_items.find_by(product_id: params[:product_id])

    if @cart_item.present?
      @cart_item.update(quantity: @cart_item.quantity + params[:quantity].to_i)
    else
      @product = Product.find(params[:product_id])
      @cart_item = current_user.cart_items.build(product: @product, quantity: params[:quantity])
    end

    if @cart_item.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def update_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    render json: { success: false }
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    render json: { success: true }
  end

  def index
    @cart_items = current_user.cart_items
    @order = Order.new
  end
end