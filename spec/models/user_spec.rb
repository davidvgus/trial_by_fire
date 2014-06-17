require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'has a valid factory' do
    expect( build(:user) ).to be_valid
  end

  it 'is invalid without email' do
    user = build(:user, email: nil)
    expect( user ).not_to be_valid
  end

  it "is invalid without username" do
    user = build(:user, user_name: nil)
    expect( user ).not_to be_valid
  end

  it "is invalid with duplicate username" do
    create(:user, user_name: "bob")
    user2 = build(:user, user_name: "bob")
    expect( user2 ).not_to be_valid
  end

  it "is invalid with duplicate email" do
    create(:user, email: "bob@test.com")
    user2 = build(:user, email: "bob@test.com")
    expect( user2).not_to be_valid
  end
end
