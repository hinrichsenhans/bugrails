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
      user.update_reset_token
      AdminMailer.password_reset(user).deliver_now
    else
      #no mail, no reset, but silently let it go
    end
    flash[:info] = "Please check your email for further instructions"
    redirect_to root_url
  end

  def reset_form
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticated(:reset, params[:token])
      @user.reset_token = params[:token]
      render 'users/change_password'
    else
      flash[:warning] = "Invalid password reset request"
      redirect_to root_url
    end
  end

  def process_reset
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticated(:reset, params[:token])
      #change password if OK
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.save
        flash[:info] = "Your password has been changed. Please log in."
        log_out
        redirect_to root_url
        return
      else
        flash[:warning] = @user.errors.messages
        @user.reset_token = params[:token]
        render 'users/change_password'
        return
      end
    end

    flash[:warning] = "Please log in or request your password reset again"
    redirect_to root_url
  end

end
