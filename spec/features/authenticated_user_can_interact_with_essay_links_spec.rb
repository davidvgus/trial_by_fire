require 'rails_helper'

feature "Authenticated user" do
  scenario "can view essay links on menubar" do
    user = create(:user)

    sign_in(user)
    visit root_path

    within(".nav") do
      expect(page).to have_content("New Essay")
      expect(page).to have_content("List Essays")
    end
  end

  context "can click through menu to" do
    scenario "view list of own essays"

    scenario "create new essay form"
  end

  context "when views essays page" do

    scenario "can not edit published essays"

    scenario "can edit drafts"
  end

  scenario "can edit a draft"
end

