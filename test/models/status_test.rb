require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "status determines substatus" do
    s = Status.new(:name => "NEW")
    assert_not s.substatus_eligible()
    
    s.name = "ASSIGNED"
    assert_not s.substatus_eligible()
    
    s.name = "RESOLVED"
    assert s.substatus_eligible()

    s.name = "VERIFIED"
    assert s.substatus_eligible()

    s.name = "CLOSED"
    assert s.substatus_eligible()

    s.name = "REOPENED"
    assert_not s.substatus_eligible()

  end


end
