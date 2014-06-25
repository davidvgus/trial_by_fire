# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :argument do
    owner_id { create(:user).id }
    con_side_id { create(:user).id }
    con_side_essay { "ConSide Essay " + Faker::Lorem.paragraphs(3).join("\n") }
    winner_id nil
    loser_id nil
    status 0

    after(:build) do |argument|
      argument.essay ||= FactoryGirl.build(:essay, :argument => argument)
    end
  end
end
