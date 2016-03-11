class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  # def edit
  # end

  # def show
  # end

  # def update
  # end

  # def destroy
  # end

end
