class UsersController < ApplicationController

  def signup
    user = User.new(allowed_params)
    if(user.save)
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def login
    #todo
    redirect_to '/'
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
