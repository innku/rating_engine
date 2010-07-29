require 'rating_engine'
require 'rails'
require 'rating_engine/routes'

module RatingEngine
  class Engine < Rails::Engine
    
    config.before_eager_load { |app| app.reload_routes! }
    
    config.active_record.observers = ['rating_engine/rating_observer']
    
  end
end