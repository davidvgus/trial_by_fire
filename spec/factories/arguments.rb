# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :argument do
    owner_id { create(:user).id }
    con_side_id { create(:user).id }
    con_side_essay { "ConSide Essay " + Faker::Lorem.paragraphs(3).join("\n") }
    winner_id nil
    loser_id nil

    #enum status: { being_critiqued: 0, selecting_judges: 10, submitted_to_judgement: 20, being_judged: 30, complete: 40}
    trait :selecting_judges do
      status 10
    end

    trait :submitted_to_judgement do
      status 20
    end

    trait :being_judged do
      status 30
    end

    trait :complete do
      status 40
    end

    after(:build) do |argument|
      argument.essay ||= FactoryGirl.build(:essay, :argument => argument)
    end
  end
end
