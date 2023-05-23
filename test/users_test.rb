require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "john", email: "john@example.com", phone: "11111", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
