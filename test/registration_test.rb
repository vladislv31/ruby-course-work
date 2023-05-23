require 'test_helper'

class RegistrationTest < ActionDispatch::IntegrationTest
  test "should register a new user" do
    get signup_path
    assert_response :success

    assert_difference 'User.count', 1 do
      post users_path, params: { name: "John", phone: "123123", email: "john@example.com", password: "password", password_confirmation: "password" }
    end

    assert_redirected_to root_path
  end

  test "should return error - password mismatch" do
    get signup_path
    assert_response :success

    assert_difference 'User.count', 0 do
      post users_path, params: { name: "John1", phone: "123123", email: "john@example.com", password: "password", password_confirmation: "password123" }
    end

    assert_equal "Паролі не співпадають.", flash[:alert]
  end
end
