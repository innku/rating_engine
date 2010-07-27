module RatingEngine
  module ConfigurationHelper
    
    def rating_class
      eval(RatingEngine.rating_class)
    end
    
    def rate_class
      eval(RatingEngine.rate_class)
    end
    
  end
end