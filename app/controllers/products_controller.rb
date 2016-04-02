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
      redirect_to action:'index'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  # if you aren't going to have a show page, just nuke the code and make sure
  # you don't have a route for it.  It's safer if you just remove it.
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action:'index'
  end

  private
    def allowed_params
      params.require(:product).permit(:name, :description)
    end

end
