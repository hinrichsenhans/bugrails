require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = bugs(:bug_one)
    @newbug = Bug.new(@bug.attributes)
    @newbug.id = nil
  end

  test "must have submitted on date when created" do
    assert @newbug.new_record?
    assert @newbug.submitted_dt.nil?
    assert @newbug.save!
    assert_not @newbug.submitted_dt.nil?
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
    # @bug.version_found_id = nil
    # assert_not @bug.valid?
  end

  test "bug must have a version" do
    # @bug.version_found_id = nil
    # assert_not @bug.valid?
  end

  #bugs probably need to have a milestone before they are "resolved"
  # test "bug must have a milestone" do
  #   @bug.component_id = nil
  #   assert_not @bug.valid?
  # end

end
