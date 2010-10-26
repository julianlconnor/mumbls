class Listing < ActiveRecord::Base
  
  has_many :listing_images, :dependent => :destroy
  has_one :category
  accepts_nested_attributes_for :listing_images, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  validates :author,  :presence => true
  validates :title,   :presence => true,
                      :length   => { :minimum => 5 }

end