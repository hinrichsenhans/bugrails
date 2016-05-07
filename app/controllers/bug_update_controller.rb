class BugUpdateController < ApplicationController
  before_action :authenticate
  before_action :check_install, :only => [:new]

  def create
    @productTarget = Product.find(params[:product][:product_id])
    @bug = @productTarget.bugs.build(allowed_params)

    if logged_in? && submitter_is_current_user? && @bug.save
      flash[:success] = "The bug has been added"
      redirect_to @bug
    else
      flash.now[:danger] = @bug.errors.messages.inspect
      redirect_to(new_bug_path(@bug))
    end
  end

  def update
    @bug = Bug.find(params[:id])
    if logged_in? && @bug.update(allowed_params)
      redirect_to bugs_path
    else
      flash.now[:danger] = @bug.errors.messages.inspect
      redirect_to(bug_path(@bug))
    end
  end


  def allowed_params
    params.require(:bug).permit(
      :title, :description, 
      :developer_id, :tester_id, :submitter_id, 
      :component_id, :milestone_id, :version_found_id,
      :version_integrated_id,
      {:comment => [:comment, :user_id]}
      )
  end

  def submitter_is_current_user?
      current_user.id == @bug.submitter_id
  end

end
