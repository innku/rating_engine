module RatingEngine
  module RatingsHelper
    def star_rating_for(rateable, params={})
      enabled, show_score = params[:enabled].nil? ? true : params[:enabled], (params[:show_score] || true)
      current_score = show_score ? score_in_pixels(rateable.average_rating) : 0
    
      render :partial => 'rating_engine/ratings/star_rating', 
             :locals => {:enabled => enabled, :current_score => current_score, 
                         :url => rating_url(rateable)}
    end
  
    def score_in_pixels(current_score)
      ((current_score * 125.0)/RatingEngine.max_score).round
    end
  
    def rating_url(rateable)
      if rateable.rated_by?(controller.current_user)
        eval("#{rateable.class.to_s.downcase}_rating_path(#{rateable.id})")
      else
        eval("#{rateable.class.to_s.downcase}_ratings_path(#{rateable.id})")
      end
    end
  end
end