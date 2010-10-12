class UserMailer < ActionMailer::Base
  default :from => "mumbls.noreply@gmail.com"
  
  def activation_email(user)
    @user = user
    @url  = "http://www.mumbls.com/activate/#{@user.activation_code}"
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(:to => user.email, :subject => "Welcome to Mumbls.com")
  end
  
  
end
