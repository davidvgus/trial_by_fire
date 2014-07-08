require 'rails_helper'

feature "Authenticated user" do
  scenario "can view essay links on menubar" do
    user = create(:user)

    sign_in(user)
    visit root_path

    within(".nav") do
      expect(page).to have_content("New Essay")
      expect(page).to have_content("List Essays")
    end
  end

  scenario "can click on New Essay link and fill out and submit form" do
    user = create(:user)

    sign_in(user)
    visit root_path

    within(".nav") do
      click_link("New Essay")
    end

    fill_in("Title", with: "Test Title")
    fill_in("Description", with: "Test Description")
    fill_in("Body", with: "Test Body")
    click_button("Save")

    expect(page).to have_content("Essay was successfully created")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("Test Description")
    expect(page).to have_content("Test Body")
  end


  scenario "view list of own essays" do
    user = create(:user)

    user_essays = {}
    3.times do |n|
      user_essays[n] = create(:essay, user: user)
    end

    other_users_essays = {}
    3.times do |n|
      other_users_essays[n] = create(:essay)
    end

    sign_in(user)
    visit root_path

    within(".nav") do
      click_link("List Essays")
    end

    expect(page).to have_content(user_essays[0].title)
    expect(page).to have_content(user_essays[1].title)
    expect(page).to have_content(user_essays[2].title)
    expect(page).not_to have_content(other_users_essays[0].title)
    expect(page).not_to have_content(other_users_essays[1].title)
    expect(page).not_to have_content(other_users_essays[2].title)

  end

  context "sees edit link on" do
    scenario "index page if essay is not published" do
      user = create(:user)
      essay = create(:essay, user: user)
      sign_in(user)

      visit user_essays_path(user)

      expect(page).to have_content(essay.title)

      expect(page).to have_link("Edit")
    end

    #scenario "show page if essay is not published" do
      #user = create(:user)
      #essay = create(:essay, user: user)
      #sign_in(user)

      #visit user_essay_path(user, essay)

      #expect(page).to have_content(essay.title)
      #within("#bottom_menu") do
        #expect(page).to have_content("Edit")
      #end
    #end
  end

  context "does not see edit link on" do
    scenario "index page if essay is published" do
      user = create(:user)
      essay = create(:essay, user: user)
      essay.published!
      sign_in(user)

      visit user_essays_path(user)

      expect(page).to have_content(essay.title)

      expect(page).not_to have_link("Edit")
    end

    #scenario "show page if essay is published" do
      #user = create(:user)
      #essay = create(:essay, user: user)
      #essay.published!
      #sign_in(user)

      #visit user_essay_path(user, essay)

      #expect(page).to have_content(essay.title)

      #within("#bottom_menu") do
        #expect(page).not_to have_content("Edit")
      #end
    #end
  end

  context "does not see destroy link on" do
    scenario "index page if essay is published" do
      user = create(:user)
      essay = create(:essay, user: user)
      essay.published!
      sign_in(user)

      visit user_essays_path(user)

      expect(page).to have_content(essay.title)

      expect(page).not_to have_link("Destroy")
    end
  end

end

