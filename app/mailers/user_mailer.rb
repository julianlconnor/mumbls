class UserMailer < ActionMailer::Base
  default :from => "noreply@mumbls.com"
  
  def activation_email(user)
    @user = user
    @url  = "http://example.com/login"
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(:to => user.email, :subject => "Welcome to Mumbls.com")
  end
  
  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(:subject => email.subject, :body => email.body)

    if email.has_attachments?
      for attachment in email.attachments
        page.attachments.create({:file => attachment, :description => email.subject})
      end
    end
    
  end
  
end
