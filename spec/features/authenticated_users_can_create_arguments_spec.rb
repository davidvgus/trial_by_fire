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
    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    scenario "see arguments they created" do
      own_arguments = []
      3.times do |n|
        own_arguments << create(:argument, owner_id: @user.id)
      end

      #make arguments user doesn't own

      visit root_path
      click_link("My Arguments")

      within('.owned_arguments') do
        expect(page).to have_content(own_arguments[0].essay.title)
        expect(page).to have_content(own_arguments[1].essay.title)
        expect(page).to have_content(own_arguments[2].essay.title)
      end

      #test that non owned args don't appear on page

    end
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
