class Restaurant < ApplicationRecord
  has_many :products
  has_one_attached :image
end
