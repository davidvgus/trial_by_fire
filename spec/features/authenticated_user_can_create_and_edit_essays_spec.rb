require 'rails_helper'

feature "An Authenticated User" do
  scenario "Can click on New Essay link and fill out and submit form" do
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
  end
end
