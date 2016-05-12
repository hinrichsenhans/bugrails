class AccountAdminController < ApplicationController
  
  def activate
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated(:activation, params[:token])
      user.activated = true
      user.activated_at = Time.zone.now
      user.save
      log_in user
      flash[:success] = "Welcome! Your account has been activated."
    else
      if user
        puts user.inspect
        puts user.activated
        puts user.activation_digest
        puts params[:token]
        puts User.digest(params[:id])
      end
      flash[:danger] = "Invalid activation request"
    end
    redirect_to root_url
  end

  def reset_request

  end

  def create_reset

  end

  def reset_form

  end

  def process_reset
    
  end

end
