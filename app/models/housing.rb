class Housing < ActiveRecord::Base
  validates_numericality_of :price, :message => "can only be a number."
  validates_inclusion_of :price, :in => 0..10000, :message => "Silly goose, rent can only be between 0 and 10000."
  validates :price,  :presence => true
  validates :title,   :presence => true,
                      :length   => { :minimum => 5 }
                      
  has_many :housing_images, :dependent => :destroy
end
