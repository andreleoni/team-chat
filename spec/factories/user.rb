FactoryGirl.define do
  factory :user do
    first_name { FFaker::Lorem.word }
    last_name { FFaker::Lorem.word }
    nickname { FFaker::Lorem.word }
    status { FFaker::Lorem.word }
    email { FFaker::Internet.email }
    password 'secret123'
  end
end
