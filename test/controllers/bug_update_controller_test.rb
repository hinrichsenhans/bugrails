require 'test_helper'

class BugUpdateControllerTest < ActionController::TestCase
  def setup
    @user = users(:user_one)
    session[:user_id] = @user.id
    @bug = bugs(:bug_one)
  end

  test "must be signed in to interact with bugs" do
    session.delete(:user_id)
    post :update, {'id' => "1"} #doesn't matter if invalid
    assert_redirected_to login_url
    post :create, {'id' => "1"} #doesn't matter if invalid
    assert_redirected_to login_url
  end

end
