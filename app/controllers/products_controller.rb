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

  def get_form_object
    @product = Product.find(params[:id])
    # respond_to do |format|
      # format.json {
      #   render json: {
      #     :success => true
      #   }
      # }
    case params[:subobject]
    when "component"
      subobject = @product.components
    when "version"
      subobject = @product.versions
    when "milestone" 
      subobject = @product.milestones
    end

    if request.xhr?
      render :partial => "product_common/select.html.erb", 
                          locals: {
                            subobject: subobject
                          }
    else
      render ""
    end
    # respond_to do |format|
    #   format.json { 
    #     render json: {
    #       :success => true, 
    #       :html => (
    #         render_to_string partial: 'product_common/select.html.erb',
    #         locals: {
    #           subobject: subobject
    #           }
    #         ).to_json.html_safe
    #       }
    #     }
    # end
  end

  private
    def allowed_params
      params.require(:product).permit(:name, :description)
    end

end
