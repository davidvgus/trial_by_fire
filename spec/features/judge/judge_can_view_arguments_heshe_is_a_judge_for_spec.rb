require 'rails_helper'


feature "Judge" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @judge_1 = create( :user, user_name: "Judge 1" )
    @judge_2 = create( :user, user_name: "Judge 2" )
    @argument_has_both_1 = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    @argument_has_both_2 = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    @argument_has_judge_1 = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    @argument_has_judge_2 = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    [@judge_1, @judge_2].each do |judge|
      @argument_has_both_1.judges << judge
      @argument_has_both_2.judges << judge
    end
    @argument_has_judge_1.judges << @judge_1
    @argument_has_judge_2.judges << @judge_2
    sign_in(@judge_1)
  end

  scenario "views his arguments page and sees the arguments he/she is/has judged/judging" do
    visit user_arguments_path(@judge_1)

    within(".judging_arguments") do
      expect(page).to have_content(@argument_has_both_1.essay.title)
      expect(page).to have_content(@argument_has_both_2.essay.title)
      expect(page).to have_content(@argument_has_judge_1.essay.title)
    end

  end

  scenario "does not see self as judging arguments they are not judges for" do
    visit user_arguments_path(@judge_1)

    within(".judging_arguments") do
      expect(page).not_to have_content(@argument_has_judge_2.essay.title)
    end

  end

end
