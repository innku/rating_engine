Factory.define :user do |f|
  f.username 'adriancuadros'
  f.name 'Adrian'
  f.last_name 'Cuadros'
end

Factory.define :product do |f|
  f.name 'Iphone'
  f.price 1000.0
end

Factory.define :rating, :class => 'RatingEngine::Rating' do |f|
  f.association :user, :factory => :user
  f.association :rateable, :factory => :product
  f.score 5
end