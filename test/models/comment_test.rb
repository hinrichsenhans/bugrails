require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new()  
    @comment.user_id = 1
    @comment.bug_id = 1
    @comment.comment = "Hello"
  end

  test "comment must not be blank" do
    @comment.comment = ""
    assert_not @comment.valid?
  end

  test "comment must have a user" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "comment must belong to a bug" do
    @comment.bug_id = nil
    assert_not @comment.valid?
  end

end
