class HousingImage < ActiveRecord::Base
  belongs_to :housing
  
  has_attached_file :photo,
                    :storage => :s3,
                    :s3_credentials =>"#{RAILS_ROOT}/config/s3.yml",
                    :path => "/housings/:housing/:style/:filename",
                    :styles => { :small => "150x150#", :large => "320x240>" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 3.megabytes

  validates_attachment_content_type :photo, :content_type => 'image/jpeg'
end
