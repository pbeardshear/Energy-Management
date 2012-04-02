FactoryGirl.define do 
  factory :hall do

    ignore do
      key 0
    end
    
    name 'some hall name'
    id { key }
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
