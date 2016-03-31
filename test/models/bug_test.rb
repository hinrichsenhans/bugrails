require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = Bug.new
    @user = User.first
    @bug.developer_id = @user.id
  end

  test "must have submitted on date when created" do
    assert @bug.submitted_dt.nil?
    assert @bug.save!
    assert_not @bug.submitted_dt.nil?
  end

  test "bug must have a developer assigned" do
    assert @bug.save!
    @bug.developer_id = nil
    assert_not @bug.valid?
  end


end
