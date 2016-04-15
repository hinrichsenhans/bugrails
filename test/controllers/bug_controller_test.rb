require 'test_helper'

class BugsControllerTest < ActionController::TestCase
  def setup
    @user = users(:user_one)
    session[:user_id] = @user.id
    @bug = bugs(:bug_one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @bug
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
