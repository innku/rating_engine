module RatingEngine
  module ActsAs
    
    def self.included(base)
      base.extend(ClassMethods)
    end
	
    module ClassMethods
      def acts_as_rateable(options = {})
        has_many  :ratings, :as => :rateable, :class_name => RatingEngine.rating_class, 
                  :dependent => :destroy, :include => :rate
        has_many  :rates, :through => :ratings, :class_name => RatingEngine.rate_class
      
        include RatingEngine::ActsAs::InstanceMethods
        extend RatingEngine::ActsAs::SingletonMethods
      end
    end
	
  	module SingletonMethods
  		# Find all objects rated by score.
  		def find_average_of( score )
        find(:all, :include => [:rates] ).collect {|i| i if i.average_rating.to_i == score }.compact
  		end
  	end
	
  	module InstanceMethods
		
  		# Calculates the average rating. Calculation based on the already given scores.
  		def average_rating
  			return 0 if rates.empty?
  			( rates.inject(0){|total, rate| total += rate.score }.to_f / rates.size )
  		end

  		# Rounds the average rating value.
  		def average_rating_round
  			average_rating.round
  		end

  		# Returns the average rating in percent. The maximal score must be provided	or the default value (5) will be used.
  		# TODO make maximum_rating automatically calculated.
  		def average_rating_percent( maximum_rating = RatingEngine.max_score )
  			f = 100 / maximum_rating.to_f
  			average_rating * f
  		end
		
  		# Checks wheter a user rated the object or not.
  		def rated_by?( user )
  			ratings.detect {|r| r.user_id == user.id }
  		end
  	end
	end
end

ActiveRecord::Base.send :include, RatingEngine::ActsAs