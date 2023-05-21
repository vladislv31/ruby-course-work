class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.status = 'created'
    @order.date = Time.now

    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      @order.order_products.build(product_id: cart_item.product_id, quantity: cart_item.quantity)
    end

    puts '========'
    puts @order

    @order.save
    puts @order.errors.full_messages


    # current_user.cart_items.destroy_all
    redirect_to root_path, notice: "Заказ успешно оформлен."
  end

  def index
    @orders = Order.order(id: :desc)
  end

  def mark_in_progress
    @order = Order.find(params[:id])
    @order.update(status: "in_progress")
    redirect_to orders_path
  end

  def mark_done
    @order = Order.find(params[:id])
    @order.update(status: "done")
    redirect_to orders_path
  end

  def mark_canceled
    @order = Order.find(params[:id])
    @order.update(status: "canceled")
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
