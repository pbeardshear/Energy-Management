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
end
