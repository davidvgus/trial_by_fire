require 'rails_helper'

feature "Authenticated user" do
  scenario "can click on New Essay link and fill out and submit form" do
    user = create(:user)

    sign_in(user)
    visit root_path

    within(".nav") do
      click_link("New Essay")
    end

    fill_in("Title", with: "Test Title")
    fill_in("Description", with: "Test Description")
    fill_in("Body", with: "Test Body")
    click_button("Save")

    expect(page).to have_content("Essay was successfully created")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("Test Description")
    expect(page).to have_content("Test Body")

  end

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

  end

end

