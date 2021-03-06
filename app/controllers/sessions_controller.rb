class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      if !user.activated
        flash[:warning] = "You must activate your account first. Please check your email."
        redirect_to root_url
        return
      end
      log_in user
      flash[:success] = "Welcome!"
      # TODO - redirect to referrer
      # however, most of these are sent with redirect
      # which doesn't update the HTTP_REFERER object
      # redirect_to(request.env['HTTP_REFERER'])
      redirect_to root_url
    else
      flash[:warning] = "Incorrect username/password"
      redirect_to request.referer
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end

end
