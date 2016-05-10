class BugUpdateController < ApplicationController
  before_action :authenticate
  before_action :check_install, :only => [:new]

  def create
    @productTarget = Product.find(params[:product][:product_id])
    @bug = @productTarget.bugs.build(allowed_params_create)

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
    if logged_in? && @bug.update(allowed_params_update)
      if has_new_comment
        @bug.comments.create!(get_bug_comment)
      end
      flash[:success] = "Bug #{@bug.id} has been updated".html_safe
      redirect_to bugs_path
    else
      flash.now[:danger] = @bug.errors.messages.inspect
      redirect_to(bug_path(@bug))
    end
  end

  def delete_comment
    @bug = Bug.find(params[:id])
    @comment = @bug.comments.find(params[:comment_id])
    if(@comment.nil?)
      respond_to do |format|
        format.html { redirect_to bug_path(@bug), :alert => "Unable to delete bug" }
        # format.json { head :ok }
      end
    else
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to bug_path(@bug) }
        # format.json { head :ok }
      end
    end
  end


  def allowed_params_create
    params.require(:bug).permit(
      :title, :description, 
      :developer_id, :tester_id, :submitter_id, 
      :component_id, :milestone_id, :version_found_id
      )
  end

  def allowed_params_update
    params.require(:bug).permit(
      :title, :description, 
      :developer_id, :tester_id, :submitter_id, 
      :component_id, :milestone_id, :version_found_id,
      :version_integrated_id,
      :status_id, :substatus_id
      )
  end

  def has_new_comment
    get_bug_comment[:comment] != ''
  end

  def get_bug_comment
    params.require(:bug).require(:comments).permit(:comment, :user_id)
  end

  def submitter_is_current_user?
      current_user.id == @bug.submitter_id
  end

end
