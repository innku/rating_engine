require 'helper'

class TestRatings < ActionController::IntegrationTest
  def setup
    @user = Factory(:user)
    @product = Factory(:product)
  end
  
  test 'new rating for product' do
    post "/products/#{@product.id}/ratings", :rating => {:score => 5}
    assert @product.average_rating == 5
  end
  
  test 'update rating for product' do
    
    post "/products/#{@product.id}/ratings", :rating => {:score => 5}
    assert @product.average_rating == 5
    
    post "/products/#{@product.id}/rating/update", :rating => {:score => 4}
    assert (@product.reload && @product.average_rating == 4)
  end
  
end