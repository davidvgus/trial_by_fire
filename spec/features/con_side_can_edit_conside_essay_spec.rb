require 'rails_helper'


feature "con_side" do
  background do
    @owner = create(:user)
    @con_side = create(:user)
    @essay = create(:essay, user: @owner)
    @essay.published!
    @argument = create(:argument, owner: @owner, con_side: @con_side, essay: @essay)
    sign_in(@con_side)
  end

  scenario "sees a con_side argument on arguments page" do
    visit root_path
    click_link "My Arguments"

    within("#con_side_argument_list") do
      expect(page).to have_content(@essay.title)
    end
  end

  scenario "can click the 'Edit Con Side Essay' link to edit and then save the con_side_essay" do
    visit user_arguments_path(@con_side, @argument)

    within("#con_side_argument_list") do
      click_on("Begin or edit your critque")
    end

    test_text = "This is some edited text"
    fill_in(:argument_con_side_essay, with: test_text)
    click_on("Update Argument")
    expect(page).to have_content(test_text)
  end

  scenario "can submit argument to judgement" do
    visit edit_user_argument_path(@con_side, @argument)
    click_on("Assign Judges")

    expect(page).to have_content("Add Judges")
  end

  scenario "sees owner essay on con_side editing page" do
    visit edit_user_argument_path(@con_side, @argument)

    expect(page).to have_content(@essay.title)
    expect(page).to have_content(@essay.description)
    expect(page).to have_content(@essay.body)
  end


end

