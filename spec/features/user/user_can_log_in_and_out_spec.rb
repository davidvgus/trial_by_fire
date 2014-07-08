require 'rails_helper'

feature 'User can ' do
  before(:each) do
    @user = create(:user,
                  user_name: "tester",
                  email: "test@test.com",
                  password: "topsecret",
                  password_confirmation: "topsecret"
                 )
  end

  scenario 'Log in using email and password' do

    sign_in(@user)
    expect(page).to have_content "Signed in successfully."
  end

  scenario 'log out' do
    sign_in(@user)

    click_on 'Sign out'
    expect(page).to have_content "Signed out successfully."
  end
end
