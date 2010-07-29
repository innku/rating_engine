module RatingEngine
  class Rating < ActiveRecord::Base
    belongs_to :rate
    belongs_to :user
    belongs_to :rateable, :polymorphic => true
    
    validates_uniqueness_of   :user_id, :scope => [:rateable_id, :rateable_type]
    validates_presence_of     :user
    validates_presence_of     :rateable
    validates_numericality_of :score, :greater_than_or_equal_to => RatingEngine.min_score, 
                              :less_than_or_equal_to => RatingEngine.max_score
    delegate                  :average_rating, :to => :rateable, :prefix => true
    attr_accessor :score
    
    
  end
end