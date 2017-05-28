FactoryGirl.define do
  factory :message do
    body "MyText"
    user_id 1
    messagable_id 1
    messagable_type "MyString"
  end
end
