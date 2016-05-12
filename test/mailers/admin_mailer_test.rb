require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:user_one)
    user.activation_token = User.new_token
    mail = AdminMailer.account_activation(user)
    assert_equal "Railszilla - Activate your account", mail.subject
    assert_equal [users(:user_one).email], mail.to
    assert_equal ["no-reply@hansdev.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    user = users(:user_two)
    user.update_reset_token
    mail = AdminMailer.password_reset(users(:user_two))
    assert_equal "Railszilla - Requested password reset", mail.subject
    assert_equal [users(:user_two).email], mail.to
    assert_equal ["no-reply@hansdev.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
