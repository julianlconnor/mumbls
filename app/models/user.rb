class User < ActiveRecord::Base
  validates_uniqueness_of :alias,  :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  def active?
    active
  end
  
  def active!
    self.active = true
    save
  end
  acts_as_authentic do |c|
    c.login_field = :email          # email is the login field
    c. validate_login_field = false # There is no login field, so don't validate it
  end
end
