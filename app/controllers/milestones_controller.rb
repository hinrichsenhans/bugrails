class MilestonesController < ApplicationController

  before_action :set_product


  def index
    @milestones = @product.milestones
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

end
