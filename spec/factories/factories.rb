FactoryGirl.define do 
  factory :hall do
    name 'some factory hall name'
    key '1'
  end
                   
  factory :green_feature do
    name 'some green name'
    content 'some green content'
  end
  
  factory :hall_feature do
    hall
    green_feature
  end

  factory :tip do
    title 'some tip name'
    content 'some tip content'
  end

  factory :category do
    name 'General'
  end

  factory :category_tip do
    tip
    category
  end

  factory :admin do
    email 'some email'
    password 'some password'
  end

end
