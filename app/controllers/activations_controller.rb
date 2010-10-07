class ActivationsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
   
  end

  def create
    @user = User.find(params[:id])
    
    raise Exception if @user.active?
    
    if @user.activate!
      redirect_to :controller => :home
    else
      render :action => :new
    end
  end

end