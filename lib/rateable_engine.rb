module RateableEngine
  
  mattr_accessor  :rating_class
  @@rating_class = 'RateableEngine::Rating'
  
  mattr_accessor  :rate_classs
  @@rate_class = 'RateableEngine::Rate'
  
  mattr_accessor  :max_score
  @@max_score = 5
  
  mattr_accessor  :min_score
  @@min_score = 1
    
  def self.setup
    yield self
  end
  
  if defined?(Rails) && Rails::VERSION::MAJOR == 3
    require 'rateable_engine/configuration_helper'
    require 'rateable_engine/acts_as_rateable'
    require 'rateable_engine/engine'
  end
  
end