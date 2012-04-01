FactoryGirl.define do 
  factory :hall do
    name 'some hall name'
    key '0'
  end

  factory :greenfeature do
    name 'some green name'
    content 'some green content'
  end

  factory :hallfeature do
    hall
    greenfeature
  end
end
