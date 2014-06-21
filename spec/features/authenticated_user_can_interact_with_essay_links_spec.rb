require 'rails_helper'

feature "Authenticated user" do
  scenario "can view essay links on menubar"

  context "can click through menu to" do
    scenario "view list of own essays"

    scenario "create new essay form"
  end

  context "when views essays page" do

    scenario "can not edit published essays"

    scenario "can edit drafts"
  end

  scenario "can edit a draft"
end

feature "Guest user" do
  scenario "Can not see essay links on menubar"
end
