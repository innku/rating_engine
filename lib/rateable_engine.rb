module RateableEngine
  
  if defined?(Rails) && Rails::VERSION::MAJOR == 3
    require 'rateable_engine/acts_as_rateable'
    require 'rateable_engine/engine'
  end
  
end