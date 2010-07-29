module RatingEngine
  module Helpers
    def self.return_to_defaults
      Metropoli.rating_class = 'RatingEngine::Rating'
      Metropoli.rate_class = 'RatingEngine::Rate'
      Metropoli.max_score = 5
      Metropoli.min_score = 1
    end
    
    def self.set_custom_classes
      Metropoli.rating_class = 'Rating'
      Metropoli.rate_class = 'Rate'
    end
    
  end
end