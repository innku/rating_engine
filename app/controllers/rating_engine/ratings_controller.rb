module RatingEngine
  class RatingsController < ApplicationController
    
    def create
      @rateable = rateable_class.find(params[rateable_param_key])
      @rating = @rateable.ratings.build(params[:rating].merge({:user => current_user}))
      respond_to do |format|
        if @rating.save
          format.json{ render :json => @rating.to_json(:methods => :rateable_average_rating) }
        else
          format.json{ render :json => @rating.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    def update
      @rateable = rateable_class.find(params[rateable_param_key])
      @rating = @rateable.ratings.where(:user_id => current_user.id).first
      respond_to do |format|
        if @rating.update_attributes(params[:rating].merge({:user => current_user}))
          format.json{ render :json => @rating.to_json(:methods => :rateable_average_rating) }
        else
          format.json{ render :json => @rating.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    private
    
    def rateable_param_key
      params.keys.find{|key| key.include?('_id') }.to_sym
    end
    
    def rateable_class_name
      rateable_param_key.to_s.gsub(/_id/, '').classify
    end
    
    def rateable_class
      eval(rateable_class_name)
    end
    
  end
end