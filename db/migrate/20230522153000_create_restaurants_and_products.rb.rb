require 'faker'

class CreateRestaurantsAndProducts < ActiveRecord::Migration[6.0]
  def change
    4.times do
      restaurant = Restaurant.new(
        name: Faker::Restaurant.name,
        description: Faker::Food.description,
        address: Faker::Address.full_address,
      )
      restaurant.image.attach(io: File.open('app/assets/images/default_restaurant_image.jpg'), filename: 'default_restaurant_image.jpg', content_type: 'image/jpeg')
      restaurant.save

      4.times do
        product = Product.new(
          name: Faker::Food.dish,
          description: Faker::Food.description,
          price: Faker::Commerce.price,
          restaurant: restaurant,
        )
        product.image.attach(io: File.open('app/assets/images/default_product_image.jpg'), filename: 'default_product_image.jpg', content_type: 'image/jpeg')
        product.save
      end
    end
  end
end
