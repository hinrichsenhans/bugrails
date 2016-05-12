require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = bugs(:bug_one)
    @newbug = Bug.new(@bug.attributes)
    @newbug.status_id = nil
    @newbug.id = nil
  end

  test "bug must have submitted on date when created" do
    assert @newbug.new_record?
    assert @newbug.submitted_dt.nil?
    assert @newbug.save!
    assert_not @newbug.submitted_dt.nil?
  end

  test "bug must have NEW status when created" do
    assert @newbug.new_record?
    assert @newbug.save!
    id = Status.find_by(:name => "NEW").id
    assert @newbug.status_id == id
    assert @newbug.substatus_id.nil?
  end

  test "bug checks for valid status and substatus combination" do
    @bug.status = Status.find_by(:name => "NEW")
    @bug.substatus = Substatus.find_by(:name => "DUPLICATE")
    @bug.valid? #does it fix it after one try?
    assert @bug.valid?
  end

  test "bug rejects valid status with ineligible substatus" do
    @bug.status = Status.find_by(:name => "RESOLVED")
    @bug.substatus = nil
    assert_not @bug.valid?
  end

  test "bug title must not be empty" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "bug description must not be empty and six or longer characters" do 
    @bug.description = ""
    assert_not @bug.valid?
    @bug.description = "12345"
    assert_not @bug.valid?
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

  # when a bug is resolved, it must have a milestone and tester
  # test "bug must have a milestone when moving to resolved" do
  #   @bug.milestone_id = nil
  # end


  # test "bug must have a version" do
  #   # @bug.version_found_id = nil
  #   # assert_not @bug.valid?
  # end

  #bugs probably need to have a milestone before they are "resolved"
  # test "bug must have a milestone" do
  #   @bug.component_id = nil
  #   assert_not @bug.valid?
  # end

end
