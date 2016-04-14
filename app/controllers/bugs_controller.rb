class BugsController < ApplicationController

  def new
    if !logged_in?
      flash[:info] = "Please sign in first"
      redirect_to '/'
    end
    @bug = Bug.new
  end

  def create
    @productTarget = Product.find(params[:product][:product_id])
    @bug = @productTarget.bugs.build(allowed_params)
    if @bug.save
      flash[:success] = "OK"
      redirect_to @bug
    else
      flash[:alert] = params
      flash[:info] = @bug.inspect
      flash[:danger] = @bug.errors.inspect
      render 'new'
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def index
  end

  # show is edit
  # def edit
  # end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(allowed_params)
      flash[:success] = "OK"
      render 'show'
    else
      flash[:alert] = params
      render 'show'
    end
  end

private
  def allowed_params
    params.require(:bug).permit(
      :title, :description, 
      :developer_id, :tester_id, :submitter_id, 
      :component_id, :milestone_id, :version_found_id,
      :version_integrated_id
      )
  end

end
