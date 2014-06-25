require 'rails_helper'


feature "Latest Arguments appear on the landing page for" do
  before(:each) do
      @arguments = []
      3.times do |n|
        @arguments << create(:argument)
      end
  end
  scenario "guests" do

    visit root_path

    within('#argument_listing') do
      expect(page).to have_content(@arguments[0].title)
      expect(page).to have_content(@arguments[1].title)
      expect(page).to have_content(@arguments[2].title)
    end
  end

  scenario "authenticated users" do
    user = create(:user)
    sign_in(user)

    within('#argument_listing') do
      expect(page).to have_content(@arguments[0].title)
      expect(page).to have_content(@arguments[1].title)
      expect(page).to have_content(@arguments[2].title)
    end

  end
end
