class User < ActiveRecord::Base
  validates_uniqueness_of :alias,  :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  # Paperclip
  has_attached_file :avatar,
                    :styles => { :thumb=> "100x100#",
                                 :small  => "150x150>" }
  validates_attachment_size :avatar, :less_than => 1.megabytes, :message => "File size can not be larger than 2mb."                            
  validates_attachment_content_type :avatar, :content_type => 'image/jpeg'                              
                                 
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
