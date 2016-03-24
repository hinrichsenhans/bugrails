class VersionsController < ApplicationController

  before_action :set_product

  def index
    @versions = @product.versions
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end
end