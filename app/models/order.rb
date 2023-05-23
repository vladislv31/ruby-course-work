class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products, dependent: :destroy
  accepts_nested_attributes_for :order_products
  
  def total_price
    order_products.sum { |order_product| order_product.quantity * order_product.product.price }
  end
end
