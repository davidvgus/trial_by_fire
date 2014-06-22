require 'rails_helper'

feature 'Unauthenticated user visits landing page' do
  scenario 'and sees top-menu' do
    visit root_path

    expect(page).to have_content('Trial by Fire')
    expect(page).to have_content('Guest Account')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end

  scenario "and does not see essay menu" do
    visit root_path

    within(".nav-tabs") do
      expect(page).not_to have_content('Essay')
    end
  end


end
