# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :argument do
    owner_id 1
    con_side_id 1
    con_side_essay "MyText"
    winner_id 1
    loser_id 1
    status 1
  end
end
