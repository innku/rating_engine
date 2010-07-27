module RatingEngine
  class RatingsController < ApplicationController
    
    def create
      @rateable = rateable_class.find(params[rateable_param_key])
      @rating = @rateable.rate_it(params[:score], current_user)
      respond_to do |format|
        unless @rating.nil?
          format.json{ render :json => @rating }
        else
          format.json{ render :json => @rating.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    def update
      
    end
    
    def destroy
      
    end
    
    private
    
    def rateable_param_key
      params.keys.find{|key| key.include?('_id') }.to_sym
    end
    
    def rateable_class_name
      rateable_param_key.to_s.delete('_id').classify
    end
    
    def rateable_class
      eval(rateable_class_name)
    end
    
  end
end