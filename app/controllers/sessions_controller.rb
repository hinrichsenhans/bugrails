class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      log_in user
      flash[:success] = "Welcome!"
      redirect_to '/'
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
