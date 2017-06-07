FactoryGirl.define do
  factory :message do
    body { FFaker::Lorem.sentence }
    association :messagable, factory: :talk
    user
  end
end
