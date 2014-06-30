require 'rails_helper'

feature "When argument has enough judges" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    @witness = create(:user)
    Argument::BASE_NUM_JUDGES.times do |n|
      @argument.judges << create(:user, user_name: "Judge_#{n}")
    end
  end

  scenario "Owner can transition argument to judging phase." do
    sign_in(@owner_user)
    visit argument_path(@argument)
    within(".begin_judgement_phase_button_div") do
      click_on("Begin Judgement Phase")
    end

    @argument.reload
    expect(@argument.being_judged?).to eql(true)
  end

  scenario "Con Side can transition argument to judging phase." do
    sign_in(@con_side_user)
    visit argument_path(@argument)
    within(".begin_judgement_phase_button_div") do
      click_on("Begin Judgement Phase")
    end

    @argument.reload
    expect(@argument.being_judged?).to eql(true)
  end
end
