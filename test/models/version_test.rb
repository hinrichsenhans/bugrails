require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  
  def setup
    @version = Version.new(name: "v1.0.0.0.0.1")
  end
  
  test "version must have valid version name" do
    @version.name = ""
    assert_not @version.valid?
  end

  test "version must have valid product id" do
    @version.product_id = nil
    assert_not @version.valid?
  end

end
