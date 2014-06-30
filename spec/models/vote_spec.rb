require 'rails_helper'

RSpec.describe Vote, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:vote)).to be_valid
  end

  it "is invalid without a user" do
    vote = build(:vote, user: nil)

    expect(vote).not_to be_valid
  end

  it "is invalid without a argument" do
    vote = build(:vote, argument: nil)

    expect(vote).not_to be_valid
  end

  it "default status is :negative" do
    vote = create(:vote)
    expect(vote.negative?).to eql true
  end
end
