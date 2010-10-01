class Listing < ActiveRecord::Base
  validates :author,  :presence => true
  validates :title,   :presence => true,
                      :length   => { :minimum => 5 }
end
