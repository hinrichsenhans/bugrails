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
    if request.xhr?
      render partial: 'users/reset'
    else
      redirect_to root_url
    end
  end

  def send_reset
    user = User.find_by(:email => params[:user][:username])
    puts user.inspect
    temp_user = User.new
    temp_user.email = params[:user][:username]
    if !temp_user.validate_email?
      flash[:danger] = "Can't reset password - incorrectly formatted email"
      redirect_to root_url
      return
    end
    if user
      #mail
    else
      #nomail
    end
    flash[:info] = "Please check your email for further instructions"
    redirect_to root_url
  end

  def reset_form
    #render form with password change
  end

  def process_reset
    #change password if OK
  end

end
