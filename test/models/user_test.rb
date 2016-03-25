require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(:name => "Test Guy", 
                     :email => "test@email.com", 
                     :password => "bestpassword",
                     :password_confirmation => "bestpassword")
    @secondUser = User.new(:name => "Test Guy 2", 
                     :email => "test2@email.com", 
                     :password => "bestpassword",
                     :password_confirmation => "bestpassword") 
  end

  test "user must have a name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "user name must be unique" do
    @secondUser.name = @user.name
    assert @user.save
    assert_not @secondUser.save
    assert @user.destroy
  end

  test "user must have email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "user email must be unique" do
    @secondUser.email = @user.email

    assert @user.save
    assert_not @secondUser.save
    assert @user.destroy

  end

  test "user email must be a valid email" do
    # a few basic tests
    @user.email = "b"
    assert_not @user.valid?

    @user.email = "b@b"
    assert_not @user.valid?

    @user.email = "@b.com"
    assert_not @user.valid?
  end

  test "password must be 6 characters or longer" do
    @user.password = "12345"
    assert_not @user.valid?
  end

  test "password must be 20 characters or shorter" do
    @user.password = "abcdefghijklmnopqrstu" #21 characters
    assert_not @user.valid?
  end

end
