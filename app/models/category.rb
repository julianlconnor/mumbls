class Category < ActiveRecord::Base
  has_many :listing
  has_many :housing
end
