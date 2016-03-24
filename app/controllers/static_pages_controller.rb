class StaticPagesController < ApplicationController
  def home
  end
  
  def bugdemo
  end

  def admin
  end

  def getsignup
    if request.xhr?
      render :partial => "users/register"
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
