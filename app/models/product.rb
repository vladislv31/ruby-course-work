class Product < ApplicationRecord
  belongs_to :restaurant
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
end