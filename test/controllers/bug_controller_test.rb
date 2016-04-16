require 'test_helper'

class BugsControllerTest < ActionController::TestCase
  def setup
    @user = users(:user_one)
    session[:user_id] = @user.id
    @bug = bugs(:bug_one)
  end

  test "must be signed in to interact with bugs" do
    session.delete(:user_id)
    get :new
    assert_redirected_to login_url
    get :show, {'id' => "1"} #doesn't matter if invalid
    assert_redirected_to login_url
    get :index
    assert_redirected_to login_url
    post :update, {'id' => "1"} #doesn't matter if invalid
    assert_redirected_to login_url
    post :create, {'id' => "1"} #doesn't matter if invalid
    assert_redirected_to login_url
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
