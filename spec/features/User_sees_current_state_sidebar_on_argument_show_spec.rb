require 'rails_helper'

feature "When User" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @judge_1 = create( :user, user_name: "Judge 1" )
    @judge_2 = create( :user, user_name: "Judge 2" )
    @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    [@judge_1, @judge_2].each do |judge|
      @argument.judges << judge
    end
  end

  context "Is the owner" do
    background do
      sign_in(@owner_user)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Owner." do
      within(".status-panel") do
        expect(page).to have_content("Current Role: Owner")
      end
    end
  end


  context "Is the con_side" do
    background do
      Sign_in(@con_side_user)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Con Side."
  end

  context "is a judge" do
    background do
      Sign_in(@judge_1)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Judge."
  end


end
