class BugsController < ApplicationController

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(allowed_params)
    @bug.milestone_id = params[:milestone_id]
    if @bug.save
      redirect_to @bug
    else
      flash[:alert] = params
      flash[:info] = @bug.inspect
      flash[:danger] = @bug.errors.inspect
      render 'new'
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    #process update
  end

private
  def allowed_params
    params.require(:bug).permit(
      :title, :description, 
      :developer, :tester, :submitter, 
      :component_id, :milestone_id, :version_id
      )
  end

end
