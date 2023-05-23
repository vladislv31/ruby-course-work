require 'test_helper'

class ProductCreationTest < ActionDispatch::IntegrationTest
  setup do
    post login_path, params: { email: "admin@admin.com", password: "1234" }
    post restaurants_path, params: { restaurant: { name: "New Restaurant", address: "123 Main St", description: "Description" } }
    @restaurant = Restaurant.last
  end

  test "should get new product form" do
    get new_restaurant_product_path(@restaurant)
    assert_response :success
  end

  test "should create a new product" do
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "New Product", price: 123, description: "Description" }, restaurant_id: @restaurant.id }
    end

    assert_redirected_to restaurant_path(@restaurant)
  end
end