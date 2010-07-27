require 'rating_engine'
require 'rails'

module RatingEngine
  class Engine < Rails::Engine
    config.before_eager_load { |app| app.reload_routes! }
  end
end