module RatingEngine
  class Rate < ActiveRecord::Base
    has_many :ratings
  
    validates_presence_of :score
    validates_uniqueness_of :score
    validates_numericality_of :score, :greater_than_or_equal_to => RatingEngine.min_score, 
                              :less_than_or_equal_to => RatingEngine.max_score
	
  	attr_accessor :user_id
  
  end
end