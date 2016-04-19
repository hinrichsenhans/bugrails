class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_install
    if Product.first.nil? ||
      Component.first.nil? ||
      Version.first.nil? ||
      Milestone.first.nil? 
      flash[:danger] = "A product must be configured with at least one version, milestone, and component"
      redirect_to admin_path
    end
      return true
  end

end
