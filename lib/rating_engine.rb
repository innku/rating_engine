module RatingEngine
  
  mattr_accessor  :rating_class
  @@rating_class = 'RatingEngine::Rating'
  
  mattr_accessor  :rate_classs
  @@rate_class = 'RatingEngine::Rate'
  
  mattr_accessor  :max_score
  @@max_score = 5
  
  mattr_accessor  :min_score
  @@min_score = 1
    
  def self.setup
    yield self
  end
  
  if defined?(Rails) && Rails::VERSION::MAJOR == 3
    require 'rating_engine/configuration_helper'
    require 'rating_engine/acts_as_rateable'
    require 'rating_engine/engine'
  end
  
end