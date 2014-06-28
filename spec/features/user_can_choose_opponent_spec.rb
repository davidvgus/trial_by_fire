require 'rails_helper'

feature "On the new argument page" do
  background do
    @owner = create(:user)
    @con_side_choice1 = create(:user)
    @con_side_choice2 = create(:user)
    @con_side_choice3 = create(:user)
    @essay = create(:essay, user: @owner)
    sign_in(@owner)
  end

  scenario "when a user clicks 'Create Argument' they are taken to show argument page" do
    visit "/users/#{@owner.id}/essays/#{@essay.id}/arguments/new"

    expect(page).to have_content("Pick your opponent and then click 'Create Argument.'")

    select @con_side_choice2.user_name, from: 'argument_con_side_id'
    click_button("commit")

    expect(page).to have_content("Argument was successfully created.")
  end
end
