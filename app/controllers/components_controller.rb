class ComponentsController < ApplicationController

  before_action :set_product

  def create

  end

  def update

  end

  def index
    @components = @product.components
  end

  def destroy

  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end
end
