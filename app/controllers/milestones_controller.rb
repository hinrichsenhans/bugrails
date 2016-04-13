class MilestonesController < ApplicationController

  before_action :set_product, :only => [:new, :create, :edit, :update, :index]

  def new
    @milestone = Milestone.new(product: @product)
  end

  def create
    @milestone = Milestone.new(allowed_params)
    @milestone.product = @product
    if @milestone.save
      redirect_to action:'index'
    else
      render 'new'
    end
  end

  def edit
    @milestone = Milestone.find(params[:id])
    @milestone.product = @product
  end

  def update
    @milestone = Milestone.find(params[:id])
    @milestone.product = @product
    if @milestone.update(allowed_params)
      redirect_to action:'index'
    else
      render 'edit'
    end
  end

  def index
    @milestones = @product.milestones
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    if @milestone.destroy
      redirect_to action:'index'
    else
      redirect_to action:'index'
      #todo: more specific action later
    end
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

   def allowed_params
      params.require(:milestone).permit(:name, :description, :product_id)
    end

end
