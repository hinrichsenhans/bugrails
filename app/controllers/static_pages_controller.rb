class StaticPagesController < ApplicationController
  before_action :authenticate, :only => [ :admin ]

  def home
  end
  
  def bugdemo
  end

  def admin
  end

  def getsignup
    if request.xhr?
      render :partial => "users/signup"
    else
      redirect_to :action => "home"
    end
  end

  def getlogin
    if request.xhr?
      render :partial =>"users/login"
    else
      redirect_to :action => "home"
    end
  end

end
