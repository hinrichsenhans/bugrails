require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # see the Status model for comments
  test "status determines substatus" do
    s = Status.new(:name => "NEW")
    assert_not s.substatusEligible()
    
    s.name = "ASSIGNED"
    assert_not s.substatusEligible()
    
    s.name = "RESOLVED"
    assert s.substatusEligible()

    s.name = "VERIFIED"
    assert s.substatusEligible()

    s.name = "CLOSED"
    assert s.substatusEligible()

    s.name = "REOPENED"
    assert_not s.substatusEligible()

  end


end
