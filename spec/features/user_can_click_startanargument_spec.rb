require 'rails_helper'

feature "On the essay show page" do
  background do
    @owner = create(:user)
    @essay = create(:essay, user: @owner)
    sign_in(@owner)
  end

  scenario "when a user clicks 'Start Argument' they are taken to the new argument page" do
    visit user_essay_path(@owner, @essay)
    within("#start_argument") do
      click_link("Start an Argument")
    end

    expect(page).to have_content("Pick your opponent and then click 'Create Argument.'")
  end
end
