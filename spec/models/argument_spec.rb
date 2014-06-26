require 'rails_helper'

RSpec.describe Argument, :type => :model do

  it "Has a valid factory" do
    expect(create(:argument)).to be_valid
  end

  it "belongs to an owner " do
    owner = create(:user)
    argument = create(:argument, owner_id: owner.id)

    expect(argument.owner).to eql(owner)
  end

  it "is invalid without an owner" do
    expect(build(:argument, owner_id: nil)).not_to be_valid
  end

  it "is invalid without an con_side_id" do
    expect(build(:argument, con_side_id: nil)).not_to be_valid
  end

  it "has nil for both winner and loser ids when first created" do
    argument = build(:argument)

    expect(argument.winner_id).to be_nil
    expect(argument.loser_id).to be_nil
  end

  it "can have judges" do
    argument = create(:argument)
    user = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    argument.judges << user
    argument.judges << user2
    argument.judges << user3

    expect(argument.judges).to match_array([user, user2, user3])
  end
end
