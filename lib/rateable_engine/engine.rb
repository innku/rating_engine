require 'rateable_engine'
require 'rails'

module RateableEngine
  class Engine < Rails::Engine
    config.before_eager_load { |app| app.reload_routes! }
  end
end