require 'helper'

class TestRating < ActiveSupport::TestCase
  
  def setup
    @rating = Factory(:rating)
  end
  
  test 'it should be valid with all the right attributes' do
    assert @rating.valid?
  end
  
  test 'it should have created a rate' do
    assert RatingEngine::Rate.count == 1
  end
  
  test 'it should create two rates when two scores are selected' do
    @rating = Factory(:rating, :score => 2)
    assert RatingEngine::Rate.count == 2
  end
  
  test 'it shouldnt create two rates when two same value scores are created' do
    Factory(:rating, :score => 5)
    assert RatingEngine::Rate.count == 1
  end
  
  test 'it should not be valid without a user' do
    @rating.user = nil
    assert !@rating.valid?
  end
  
  test 'it should not be valid if not rating anything' do
    @rating.rateable = nil
    assert !@rating.valid?
  end
  
  test 'it should not be valid without a score' do
    @rating.score = nil
    assert !@rating.valid?
  end
  
  test 'it should not be valid with a score lower than minimum default' do
    @rating.score = 0
    assert !@rating.valid?
  end
  
  test 'it should not be valid with a score higher than maximum default' do
    @rating.score = 6
    assert !@rating.valid?
  end
  
  test 'cant have two ratings from the same user on the same rateable' do
    @new_rating = RatingEngine::Rating.new(Factory.attributes_for(:rating, :user => @rating.user, :rateable => @rating.rateable))
    assert !@new_rating.valid?
  end

end