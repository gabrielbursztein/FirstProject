require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get Login" do
    get user_Login_url
    assert_response :success
  end

end
