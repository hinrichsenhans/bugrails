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

  # def edit
  # end

  # def show
  # end

  # def update
  # end

  # def destroy
  # end

  private
    def allowed_params
      params.require(:product).permit(:name, :description)
    end

end
