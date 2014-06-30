require 'rails_helper'

feature "When argument" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
    @witness = create(:user)
    Argument::BASE_NUM_JUDGES.times do |n|
      @argument.judges << create(:user, user_name: "Judge_#{n}")
    end
  end

  context "has enough judges and is in judging phase" do
    scenario "Judge can cast up-vote" do
      sign_in(@argument.judges.first)
      visit argument_path(@argument)
      within(".voting_booth") do
        click_on("Affirm the motion")
      end

      @argument.reload
      expect(@argument.being_judged?).to eql(true)
      within(".vote_tally") do
        expect(page).to have_content("Affirmatives: 1")
        expect(page).to have_content("Negatives: 0")
        expect(page).to have_content("Undecided: 4")
      end
    end

    scenario "judge can cast down-vote"

    context "Non Judges" do
      scenario "owner can not see voting booth"
      scenario "con side can not see voting booth"
      scenario "witness can not see voting booth"
      scenario "guest can not see voting booth"
    end
  end


end
