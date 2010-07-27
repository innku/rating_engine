module ActionDispatch::Routing
  class Mapper
    def rating_engine_for(*resources)
      resources.map{|resource_name| resource_route(resource_name.to_s) }
    end
    
    protected
    
    def resource_route(resource_name)
      self.match  "#{resource_name}/:#{resource_name.singularize}_id/ratings" => "rating_engine/ratings#create",
                  :controller => "rating_engine/ratings", :as => "#{resource_name.singularize}_ratings"
    end
    
  end
end