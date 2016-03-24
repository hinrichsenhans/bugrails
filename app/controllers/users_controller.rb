class UsersController < ApplicationController

  def create
    user = User.new(allowed_params)
    if(user.save)
      redirect_to '/'
    else
      render '/signup'
    end
  end


  private

    def allowed_params
      params.require(:user).permit(:name, 
                                   :email, 
                                   :password, 
                                   :password_confirmation)
    end

end
