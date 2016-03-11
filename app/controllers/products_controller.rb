class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(allowed_params)
    if @product.save
      render 'index'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  # def show
  # end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      redirect_to action:'index'
    else
      render 'edit'
    end
  end

  # def destroy
  # end

  private
    def allowed_params
      params.require(:product).permit(:name, :description)
    end

end
