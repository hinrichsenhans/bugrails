require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(name: "Product Test")
  end

  test "product must have a name" do
    @product.name = ""
    assert_not @product.valid?
  end

  
end
