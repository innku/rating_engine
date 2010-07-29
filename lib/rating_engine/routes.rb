module ActionDispatch::Routing
  class Mapper
    def rating_engine_for(*resources)
      resources.map{|resource_name| rating_route(resource_name.to_s) }
    end
    
    protected
    
    def rating_route(resource_name)
      self.match  "#{resource_name}/:#{resource_name.singularize}_id/ratings" => "rating_engine/ratings#create",
                  :controller => "rating_engine/ratings", :as => "#{resource_name.singularize}_ratings", :method => :post
      self.match  "#{resource_name}/:#{resource_name.singularize}_id/rating/update" => "rating_engine/ratings#update",
                  :controller => "rating_engine/ratings", :as => "#{resource_name.singularize}_rating", :method => :put
    end
    
  end
end