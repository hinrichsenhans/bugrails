class ComponentsController < ApplicationController
  # you may want to make this not fire on the show action since you are redirecting
  # right away. That will save you a DB hit on that page. You could also use nested
  # resources the way we did in class, now that you have a working example.
  
  # HH 4/12/16 - added :only restriction, will move to resources soon as that is a good point.
  
  before_action :set_product, :only => [:new, :create, :edit, :update, :index]

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
