class OrdersController < ApplicationController
  def create
    @order = current_user.orders.build(order_params)
    @order.status = 'created'
    @order.date = Time.now
    @order.products = current_user.cart_items.map(&:product)

    @order.save

    current_user.cart_items.destroy_all
    redirect_to root_path, notice: "Заказ успешно оформлен."
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
