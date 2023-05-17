class CartItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @cart_item = current_user.cart_items.build(product: @product, quantity: params[:quantity])

    if @cart_item.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def show
    @cart_items = current_user.cart_items
  end
end