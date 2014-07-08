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
    @witness = create(:user)
  end

  shared_examples "shows judges" do
    scenario "lists judges in sidebar" do
      within(".sidebar_judges") do
        expect(page).to have_content(@judge_1.user_name)
        expect(page).to have_content(@judge_2.user_name)
      end
    end
  end


  context "is the owner" do
    background do
      sign_in(@owner_user)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Owner." do
      within(".status-panel") do
        expect(page).to have_content("Your Role: Owner")
      end
    end

    include_examples "shows judges"
  end

  context "is the con_side" do
    background do
      sign_in(@con_side_user)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Con Side." do
      within(".status-panel") do
        expect(page).to have_content("Your Role: Con Side")
      end
    end
    include_examples "shows judges"
  end

  context "is a judge" do
    background do
      sign_in(@judge_1)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Judge." do
      within(".status-panel") do
        expect(page).to have_content("Your Role: Judge")
      end
    end
    include_examples "shows judges"
  end

  context "is a judge" do
    background do
      sign_in(@judge_2)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Judge." do
      within(".status-panel") do
        expect(page).to have_content("Your Role: Judge")
      end
    end
    include_examples "shows judges"
  end

  context "is a witness" do
    background do
      sign_in(@witness)
      visit argument_path(@argument)
    end
    scenario "and views an argument page he sees that current role is set to Witness." do
      within(".status-panel") do
        expect(page).to have_content("Your Role: Witness")
      end
    end
    include_examples "shows judges"
  end


end
