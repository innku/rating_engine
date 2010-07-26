module RateableEngine
  module ConfigurationHelper
    
    def rating_class
      eval(RateableEngine.rating_class)
    end
    
    def rate_class
      eval(RateableEngine.rate_class)
    end
    
  end
end