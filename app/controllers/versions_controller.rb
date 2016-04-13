class VersionsController < ApplicationController

  before_action :set_product, :only => [:new, :create, :edit, :update, :index]

  def new
    @version = Version.new(product: @product)
  end

  def create
    @version = Version.new(allowed_params)
    @version.product = @product
    if @version.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @version = Version.find(params[:id])
    @version.product = @product
  end

  def update
    @version = Version.find(params[:id])
    @version.product = @product
    if @version.update(allowed_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def index
    @versions = @product.versions
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    @version = Version.find(params[:id])
    if @version.destroy
      redirect_to action: 'index'
    else
      redirect_to action: 'index'
      #todo: more specific action later
    end
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def allowed_params
      params.require(:version).permit(:name, :product_id)
    end
end