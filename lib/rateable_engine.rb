module RateableEngine
  
  if defined?(Rails) && Rails::VERSION::MAJOR == 3
    require 'rateable/acts_as_rateable'
    require 'rateable/engine'
  end
  
end