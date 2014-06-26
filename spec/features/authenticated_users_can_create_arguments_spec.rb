require 'rails_helper'

feature "users" do

  context "see, on the arguments index page," do
    scenario "a list of unused arguments."
    scenario "a list of used (published) arguments."
  end

  scenario "who are authed can see My Arguments link on menu" do
    user = create(:user)
    sign_in(user)

    visit root_path
    within('.nav') do
      expect(page).to have_content("My Arguments")
    end
  end
  context "who are authed can click on arguments link in menubar and " do
    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    scenario "see only arguments they created in .owned_arguments div" do
      own_arguments = []
      3.times do |n|
        own_arguments << create(:argument, owner_id: @user.id)
      end

      other_arguments = []
      3.times do |n|
        other_arguments << create(:argument)
      end

      visit root_path
      click_link("My Arguments")

      within('.owned_arguments') do
        expect(page).to have_content(own_arguments[0].essay.title)
        expect(page).to have_content(own_arguments[1].essay.title)
        expect(page).to have_content(own_arguments[2].essay.title)
        expect(page).not_to have_content(other_arguments[0].essay.title)
        expect(page).not_to have_content(other_arguments[1].essay.title)
        expect(page).not_to have_content(other_arguments[2].essay.title)
      end
    end

    scenario "see arguments they are con_sides for" do
      own_arguments = []
      3.times do |n|
        own_arguments << create(:argument, owner_id: @user.id)
      end

      other_arguments = []
      3.times do |n|
        other_arguments << create(:argument)
      end

      con_side_arguments = []
      3.times do |n|
        con_side_arguments << create(:argument, con_side_id: @user.id)
      end

      visit root_path
      click_link("My Arguments")

      within('.con_side_arguments') do
        expect(page).to have_content(con_side_arguments[0].essay.title)
        expect(page).to have_content(con_side_arguments[1].essay.title)
        expect(page).to have_content(con_side_arguments[2].essay.title)

        expect(page).not_to have_content(own_arguments[0].essay.title)
        expect(page).not_to have_content(own_arguments[1].essay.title)
        expect(page).not_to have_content(own_arguments[2].essay.title)

        expect(page).not_to have_content(other_arguments[0].essay.title)
        expect(page).not_to have_content(other_arguments[1].essay.title)
        expect(page).not_to have_content(other_arguments[2].essay.title)
      end

    end
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
