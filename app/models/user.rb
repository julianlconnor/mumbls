class User < ActiveRecord::Base
  acts_as_authentic
  validates_uniqueness_of :alias,  :presence => true
  validates_length_of :alias, :minimum => 3, :message => "Alias must be at least 3 characters."
  validates_uniqueness_of :email, :presence => true, :email_format => true, :message => "Sorry, but a user with the emails %s, already exists."
  validates_attachment_size :avatar, :less_than => 1.megabytes, :message => "File size can not be larger than 2mb.", :content_type => 'image/jpeg' 
  
  
  # Associations
  has_many :listings
  has_many :housings
  # Paperclip
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials =>"#{RAILS_ROOT}/config/s3.yml",
                    :path => "/users/:user/:style/:filename",
                    :styles => { :thumb=> "75x75#",
                                 :small  => "150x150>" }
                                                     
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
