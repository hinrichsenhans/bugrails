require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  
  def setup
    @milestone = Milestone.new(name: "Latest and Greatest")
  end
  
  test "milestone must have valid version name" do
    @milestone.name = ""
    assert_not @milestone.valid?
  end

  test "milestone must have valid product id" do
    @milestone.product_id = nil
    assert_not @milestone.valid?
  end

end
