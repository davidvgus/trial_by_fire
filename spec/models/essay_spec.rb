require 'rails_helper'

RSpec.describe Essay, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:essay)).to be_valid
  end

  it "is invalid without a title" do
    essay = build(:essay, title: nil)

    expect(essay).not_to be_valid
  end

  it "is invalid without a body" do
    essay = build(:essay, body: nil)

    expect(essay).not_to be_valid
  end

  it "is invalid without a description" do
    essay = build(:essay, description: nil)

    expect(essay).not_to be_valid
  end

  it "is invalid without a user" do
    essay = build(:essay, user: nil)

    expect(essay).not_to be_valid
  end

  it "default status is :draft" do
    essay = build(:essay)

    expect(essay.status).to eql "draft"
  end
end
