# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :essay do
    user nil
    title "MyString"
    description "MyString"
    body "MyText"
    status 1
  end
end
