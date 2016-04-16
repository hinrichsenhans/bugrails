require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "must be signed in to view users list" do
    get users_path
    assert_redirected_to login_url
  end
end
