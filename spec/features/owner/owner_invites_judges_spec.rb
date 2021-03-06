require 'rails_helper'

feature "Owner invites judges" do
  background do
    @con_side_user = create( :user, user_name: "Con Side User")
    @judge_1 = create( :user, user_name: "Judge 1" )
    @judge_2 = create( :user, user_name: "Judge 2" )
    @owner_user = create( :user, user_name: "Owner User" )
    @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
  end

  scenario "add_judges correctly adds judges" do
    sign_in(@owner_user)
    visit argument_path(@argument)
    check(@judge_1.user_name)
    check(@judge_2.user_name)

    click_on 'Add Judges'
    @argument.reload
    expect(@argument.judges).to match_array [@judge_1, @judge_2]
  end

  scenario "owner is not a choice for con side to add as a judge" do
    sign_in(@owner_user)
    visit argument_path(@argument)
    check(@judge_1.user_name)
    check(@judge_2.user_name)

    click_on 'Add Judges'
    @argument.reload
    expect(@argument.judges).to match_array [@judge_1, @judge_2]
    within(".judges") do
      expect(page).not_to have_content("Owner User")
    end
  end

  scenario "con_side is not a choice for con side to add as a judge" do
    sign_in(@owner_user)
    visit argument_path(@argument)
    check(@judge_1.user_name)
    check(@judge_2.user_name)

    click_on 'Add Judges'
    @argument.reload
    expect(@argument.judges).to match_array [@judge_1, @judge_2]
    within(".judges") do
      expect(page).not_to have_content("Con Side User")
    end
  end
  #scenario "invites judge who is not yet a user"
end
