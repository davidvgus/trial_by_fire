require 'rails_helper'

feature "users" do
  scenario "who are authed can see My Arguments link on menu" do
    user = create(:user)
    sign_in(user)

    visit root_path
    within('.nav') do
      expect(page).to have_content("My Arguments")
    end
  end
  context "who are authed can click on argument link in menubar and " do
    scenario "see arguments they created"
    scenario "see arguments they are cons_sides for"
    scenario "see arguments they are judging"
  end

  context "Who are not authed" do
    scenario "can not see argument link" do
      visit root_path

      within('.nav') do
        expect(page).not_to have_content("My Arguments")
      end
    end
  end

end
