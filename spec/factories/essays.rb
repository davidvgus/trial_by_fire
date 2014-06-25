# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:title) { |n| "Boxers or #{Faker::Address.city}#{n}?" }
  factory :essay do
    user
    title
    description { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(3, true).join("\n") }
  end
end
