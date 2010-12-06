class Housing < ActiveRecord::Base
  
  # searchable do
  #   text :title
  #   text :description
  # end
  
  has_many :housing_images, :dependent => :destroy
  # user = 'author'
  has_one :user
  
  validates_numericality_of :price, :message => "can only be a number."
  validates_inclusion_of :price, :in => 0..10000, :message => "Silly goose, rent can only be between $0 and $10,000."
  
  validates :price,  :presence => true
  validates :title,   :presence => true,
                      :length   => { :minimum => 5 }
  
  accepts_nested_attributes_for :housing_images, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
                      
end
