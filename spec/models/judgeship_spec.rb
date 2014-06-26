require 'rails_helper'

RSpec.describe Judgeship, :type => :model do

  it "had a valid factory" do
    expect(build(:judgeship)).to be_valid
  end

  context "Should be invalid without " do
    it "a user " do
      judgeship = build(:judgeship, user: nil)

      expect(judgeship).to be_invalid
    end

    it "an argument" do
      judgeship = build(:judgeship, argument: nil)

      expect(judgeship).to be_invalid
    end
  end

end

