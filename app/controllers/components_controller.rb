class ComponentsController < ApplicationController

  before_action :set_product

  def new
    @component = Component.new(product: @product)
  end

  def create
    @component = Component.new(allowed_params)
    @component.product = @product
    if @component.save
      redirect_to action:'index'
    else
      render 'new'
    end
  end

  def edit
    @component = Component.find(params[:id])
    @component.product = @product
  end

  def update
    @component = Component.find(params[:id])
    @component.product = @product
    if @component.update(allowed_params)
      redirect_to action:'index'
    else
      render 'edit'
    end
  end

  def index
    @components = @product.components
  end

  def show
    redirect_to action:'index'
  end

  def destroy
    @component = Component.find(params[:id])
    @component.product = @product
    if @component.destroy
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
      params.require(:component).permit(:name, :description, :product_id)
    end
end
