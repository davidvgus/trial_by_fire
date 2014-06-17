# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:user_label) do
    |n| "user#{n}"
  end

  sequence(:email) { |n| "user#{n}@test.com" }
  sequence(:user_name) { |n| "user#{n}" }

  factory :user do
    email
    user_name
    password "asdfasdf"
    password_confirmation { |user| user.password }
    after(:build) { |user| user.skip_confirmation! }
  end
end
