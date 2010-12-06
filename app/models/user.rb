class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
           :rememberable, :registerable, :trackable, :timeoutable, :validatable,
           :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates_uniqueness_of :alias,  :presence => true
  validates_length_of :alias, :minimum => 3, :message => "Alias must be at least 3 characters."
  validates_uniqueness_of :email, :presence => true, :email_format => true, :message => "Sorry, but a user with the emails %s, already exists."
  validates_attachment_size :avatar, :less_than => 1.megabytes, :message => "File size can not be larger than 2mb.", :content_type => 'image/jpeg' 
  
  
  # Associations
  has_many :listings
  has_many :housings
  # Paperclip
  has_attached_file :avatar,
                    :styles => { :thumb=> "75x75#",
                                 :small  => "150x150>" }
                                                     
  def active?
    active
  end
  
  def active!
    self.active = true
    save
  end
end
