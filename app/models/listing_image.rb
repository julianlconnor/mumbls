class ListingImage < ActiveRecord::Base
  
  belongs_to :listing
  
  has_attached_file :photo,
                    :storage => :s3,
                    :s3_credentials =>"#{RAILS_ROOT}/config/s3.yml",
                    :path => "/listings/:listing/:style/:filename",
                    :styles => { :thumb => "50x50#", :small => "140x140#", :large => "550x456>" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 2.megabytes

  validates_attachment_content_type :photo, :content_type => 'image/jpeg'     

end
