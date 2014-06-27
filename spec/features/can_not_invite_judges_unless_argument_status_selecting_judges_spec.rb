
require 'rails_helper'

feature "Can not invite judges as" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
  end

  context "owner" do
    scenario "when argument.status == being_critiqued" do
      @argument = create(:argument, con_side: @con_side_user, owner: @owner_user)
      sign_in(@owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == being_judged" do
      @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
      sign_in(@owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == complete" do
      @argument = create(:argument, :complete, con_side: @con_side_user, owner: @owner_user)
      sign_in(@owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end
  end

  context "con_side" do
    scenario "when argument.status == being_critiqued" do
      @argument = create(:argument, con_side: @con_side_user, owner: @owner_user)
      sign_in(@con_side_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == being_judged" do
      @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
      sign_in(@con_side_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == complete" do
      @argument = create(:argument, :complete, con_side: @con_side_user, owner: @owner_user)
      sign_in(@con_side_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end
  end

  context "Non owner/con_side" do
    background do
      @user = create(:user)
    end

    scenario "when argument.status == being_critiqued" do
      @argument = create(:argument, con_side: @con_side_user, owner: @owner_user)
      sign_in(@user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == being_critiqued" do
      @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
      sign_in(@user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == being_judged" do
      @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
      sign_in(@user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == complete" do
      @argument = create(:argument, :complete, con_side: @con_side_user, owner: @owner_user)
      sign_in(@user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end
  end

  context "Unauthed User" do

    scenario "when argument.status == being_critiqued" do
      @argument = create(:argument, con_side: @con_side_user, owner: @owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == selecting_judges" do
      @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == being_judged" do
      @argument = create(:argument, :being_judged, con_side: @con_side_user, owner: @owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end

    scenario "when argument.status == complete" do
      @argument = create(:argument, :complete, con_side: @con_side_user, owner: @owner_user)
      visit argument_path(@argument)

      expect(page).not_to have_content("Add Judges")
    end
  end
end
