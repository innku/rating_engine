require 'rails/generators/migration'

module RatingEngine
  module Generators
    class InstallGenerator < Rails::Generators::Base 
      include Rails::Generators::Migration
      
      source_root File.expand_path('../templates',__FILE__)

      def self.next_migration_number(path)
        @seconds = @seconds.nil? ? Time.now.sec : (@seconds + 1)
        @seconds = "0#{@seconds.to_s}" if @seconds < 10
        Time.now.utc.strftime("%Y%m%d%H%M") + @seconds.to_s
      end

      def generate_rates_migration
        migration_template 'migrate/create_rates.rb', 'db/migrate/create_rates.rb' 
      end
      
      def generate_ratings_migration
        migration_template 'migrate/create_ratings.rb', 'db/migrate/create_ratings.rb' 
      end
      
      def generate_configuration_file
        copy_file   'initializers/rating_engine.rb', 'config/initializers/rating_engine.rb' 
      end
      
      def show_readme
        readme 'README'
      end
      
    end
  end
end
