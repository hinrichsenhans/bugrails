class UsersController < ApplicationController

  def signup
    user = User.new(allowed_params)
    if(user.save)
      log_in(user)
      redirect_to '/'
    else
      flash[:warning] = "Unable to register under that username"
      redirect_to '/'
    end
  end


  def index
    #todo - check for admin rights
    @users = User.all
  end


  private

    def allowed_params
      params.require(:user).permit(:name, 
                                   :email, 
                                   :password, 
                                   :password_confirmation)
    end

end
