require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = Bug.new
  end

  test "must have submitted on date when created" do
    assert @bug.submitted_dt.nil?
    assert @bug.save
    assert_not @bug.submitted_dt.nil?
  end


end
