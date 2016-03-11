require 'test_helper'

class ComponentTest < ActiveSupport::TestCase

  def setup
    @component = Component.new(name: "Test component")
  end


  test "component must have product associated" do
    @component.product_id = nil
    assert_not @component.valid?
  end

  test "component must have a name" do
    @component.name = ""
    assert_not @component.valid?
  end

end
