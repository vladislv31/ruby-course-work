require 'test_helper'

class RestaurantCreationTest < ActionDispatch::IntegrationTest
  setup do
    post login_path, params: { email: "admin@admin.com", password: "1234" }
  end

  test "should get new restaurant form" do
    get new_restaurant_path
    assert_response :success
  end

  test "should create a new restaurant" do
    assert_difference 'Restaurant.count', 1 do
      post restaurants_path, params: { restaurant: { name: "New Restaurant", address: "123 Main St", description: "Description" } }
    end

    assert_redirected_to root_path
  end
end