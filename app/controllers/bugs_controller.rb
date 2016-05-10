class BugsController < ApplicationController
  before_action :authenticate
  before_action :check_install, :only => [:new]

  def new
    if !logged_in?
      flash[:info] = "Please sign in first"
      redirect_to '/'
    end
    @bug = Bug.new
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def index
    @bugs = Bug.active_bugs
  end

  def index_all
    @bugs = Bug.all_bugs
    render 'index'
  end


  private

end
