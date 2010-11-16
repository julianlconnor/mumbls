class Listing < ActiveRecord::Base
  
  searchable do
    text :title
    text :description
  end
  
  has_many :listing_images, :dependent => :destroy
  has_one :category
  has_one :user
  accepts_nested_attributes_for :listing_images, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  validates_numericality_of :price, :message => "Can only be a number."
  validates_inclusion_of :price, :in => 0..100000, :message => "Silly goose, price can only be between 0 and $100,000."
  
  validates :author,  :presence => true
  validates :title,   :presence => true,
                      :length   => { :minimum => 5 }
                      


end