module RatingEngine
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../app',__FILE__)
      
      def generate_partial
        copy_file   'views/rating_engine/ratings/_star_rating.html.erb', 'app/views/rating_engine/ratings/_star_rating.html.erb'
      end
      
      def generate_helper
        copy_file   'helpers/rating_engine/ratings_helper.rb', 'app/helpers/rating_engine/ratings_helper.rb'
      end
      
    end
  end
end