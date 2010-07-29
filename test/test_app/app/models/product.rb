class Product < ActiveRecord::Base
  acts_as_rateable
  validates_presence_of :price
  validates_presence_of :name
  
end
