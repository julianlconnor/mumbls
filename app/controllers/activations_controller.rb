class ActivationsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
   
  end

  def resend_form
  end
  def resend_activation
    @user = User.find(:first, :conditions => { :email => params[:activation][:email] } )
    logger.debug "!!! Params : #{params}"
    if !@user.nil?
      UserMailer.activation_email(@user).deliver
      flash[:notice] = "Activation email has been resent to #{params[:activation][:email]}."
    else
      flash[:notice] = "Unable to find a user with the email:!!! #{params[:activation][:email]}."
    end
    redirect_to :controller => :home
  end

  def create
    # @user = User.where("activation_code = #{params[:activation_code]}")
    @user = User.find(:first, :conditions => {:activation_code => "#{params[:activation_code]}"})
    # SELECT `users`.* FROM `users` WHERE (`users`.`activation_code` = 'a9a7f69dd773546f89a4e8c555fbb6a8')
    # SELECT `users`.* FROM `users` WHERE (`users`.`activation_code` = 'a9a7f69dd773546f89a4e8c555fbb6a8')
    # @user.active = true
    #     @user.save
    #     flash[:notice] = "Thank you for activating your account #{@user.name}."
    #     redirect_to :controller => :home
    if @user
      @user.active = true
      if @user.save
        flash[:notice] = "Thank you for activating your account #{@user.name}."
        redirect_to :controller => :home
      else
        flash[:notice] = "Unable to active your account."
        redirect_to :controller => :home
      end   
    else
      flash[:notice] = "Unable to locate an account with the activation code : #{params[:activation_code]}"
      redirect_to :controller => :home
    end
  end

end