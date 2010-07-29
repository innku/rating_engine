module RatingEngine
  module ConfigurationHelper
    
    def self.rating_class
      eval(RatingEngine.rating_class)
    end
    
    def self.rate_class
      eval(RatingEngine.rate_class)
    end
    
  end
end