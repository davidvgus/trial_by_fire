require 'rails_helper'

feature "Signing Up" do
  scenario "Signs up" do
    visit '/users/sign_up'

    fill_in 'User name', with: 'test'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'

    click_on 'Sign up'
    expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
  end
end
