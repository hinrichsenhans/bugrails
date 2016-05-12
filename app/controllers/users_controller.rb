class UsersController < ApplicationController
  before_action :authenticate, :except => [:signup]

  def signup
    user = User.new(allowed_params)
    if(user.save)
      AdminMailer.account_activation(user).deliver_now
      flash[:info] = "One more step - please use the link emailed to you to activate your account"
      redirect_to root_url
    else
      #todo - make this pretty
      #todo - redirect to signup, not login
      flash[:warning] = user.errors.messages.inspect
      redirect_to login_path
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
