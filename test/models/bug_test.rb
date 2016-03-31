require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = Bug.new
    @user = User.first
    @bug.developer_id = @user.id
    @bug.submitter_id = @user.id
    @bug.tester_id = @user.id
    @bug.version_found_id = Version.first.id
    @bug.component_id = Component.first.id
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

  test "bug must have a submitter" do
    assert @bug.save!
    @bug.submitter_id = nil
    assert_not @bug.valid?
  end

  test "bug must have a tester" do
    assert @bug.save!
    @bug.tester_id = nil
    assert_not @bug.valid?
  end

  test "bug must have a component" do
    @bug.component_id = nil
    assert_not @bug.valid?
  end

  test "bug must have a version found" do
    @bug.version_found_id = nil
    assert_not @bug.valid?
  end

  test "bug must have a version" do
    @bug.version_found_id = nil
    assert_not @bug.valid?
  end

  #bugs probably need to have a milestone before they are "resolved"
  # test "bug must have a milestone" do
  #   @bug.component_id = nil
  #   assert_not @bug.valid?
  # end

end
