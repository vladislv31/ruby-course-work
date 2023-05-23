require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    post users_path, params: { name: "John1", phone: "123123", email: "john123@example.com", password: "1234", password_confirmation: "1234" }
  end

  test "should log in with valid credentials" do
    get login_path
    assert_response :success

    post login_path, params: { email: "john123@example.com", password: "1234" }
    assert_redirected_to root_path
  end

  test "should return error - wrong credentials" do
    get login_path
    assert_response :success

    post login_path, params: { email: "john123@example.com", password: "12345" }
    assert_equal "Неправильний емейл або пароль.", flash[:alert]
  end
end