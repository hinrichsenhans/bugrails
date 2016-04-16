class UsersController < ApplicationController
  before_action :authenticate, :except => [:signup]

  def signup
    user = User.new(allowed_params)
    if(user.save)
      log_in(user)
      redirect_to '/'
    else
      #todo - make this pretty
      #todo - redirect to signup, not login
      flash[:warning] = user.errors.messages.inspect
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
