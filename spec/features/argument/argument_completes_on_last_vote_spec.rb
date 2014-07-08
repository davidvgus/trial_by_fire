require 'rails_helper'

feature "As a judge" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
    @witness = create(:user)
    @judge1 = create(:user)
    @argument.judges << @judge1
    @judge2 = create(:user)
    @argument.judges << @judge2
    @judge3 = create(:user)
    @argument.judges << @judge3
    @judge4 = create(:user)
    @argument.judges << @judge4
    @judge5 = create(:user)
    @argument.judges << @judge5
    @judge6 = create(:user)
    @argument.judges << @judge6
    sign_in(@judge1)
  end

  scenario "Argument is comleted when all judges have voted" do
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

    sign_out

    sign_in(@judge2)
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 2")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 4")
      expect(page).to have_content("Total: 6")
    end

    sign_out

    sign_in(@judge3)
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 3")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 3")
      expect(page).to have_content("Total: 6")
    end

    sign_out

    sign_in(@judge4)
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 4")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 2")
      expect(page).to have_content("Total: 6")
    end

    sign_out

    sign_in(@judge5)
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 5")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 1")
      expect(page).to have_content("Total: 6")
    end
    sign_out

    sign_in(@judge6)
    visit argument_path(@argument)
    within(".voting_booth") do
      click_on("Affirm the motion")
    end

    #@argument.reload
    within(".vote_tally") do
      expect(page).to have_content("Affirmative: 6")
      expect(page).to have_content("Negative: 0")
      expect(page).to have_content("Undecided: 0")
      expect(page).to have_content("Total: 6")
    end
    @argument.reload
    expect(@argument.complete?).to eql true
  end
end
