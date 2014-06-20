require 'rails_helper'

feature 'Unauthenticated user' do
  scenario 'visits landing page and sees top-menu' do
    visit root_path

    expect(page).to have_content('Trial by Fire')
    expect(page).to have_content('Guest Account')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')

  end
end
