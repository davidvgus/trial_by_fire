
require 'rails_helper'

feature "As a judge" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
    @witness = create(:user)
    Argument::BASE_NUM_JUDGES.times do |n|
      @argument.judges << create(:user, user_name: "Judge_#{n}")
    end
    @judge = create(:user)
    @argument.judges << @judge
    sign_in(@judge)
  end

  scenario "user can cast up-vote" do
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 1")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 5")
      expect(page).to have_content("Total: 6")
    end
  end
end
