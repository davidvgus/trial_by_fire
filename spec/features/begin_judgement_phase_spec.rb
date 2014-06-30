require 'rails_helper'

feature "When argument" do
  background do
    @owner_user = create( :user, user_name: "Owner User" )
    @con_side_user = create( :user, user_name: "Con Side User")
    @argument = create(:argument, :selecting_judges, con_side: @con_side_user, owner: @owner_user)
    @witness = create(:user)
  end

  shared_examples "user can not see 'Begin Judgement Phase'" do
    scenario "user can see 'Begin Judgement Phase'" do
      expect(page).not_to have_content('Begin Judgement Phase')
    end
  end


  context "has Argument::BASE_NUM_JUDGES or greater judges" do
    background do
      Argument::BASE_NUM_JUDGES.times do |n|
        @argument.judges << create(:user, user_name: "Judge_#{n}")
      end

    end
    context "and user is owner" do
      background do
        sign_in(@owner_user)
        visit argument_path @argument
      end

      scenario "user can see 'Begin Judgement Phase'" do
        within(".begin_judgement_phase_button") do
          expect(page).to have_content('Begin Judgement Phase')
        end
      end
    end

    context "and user is con_side" do
      background do
        sign_in(@con_side_user)
        visit argument_path @argument
      end

      scenario "user can see 'Begin Judgement Phase'" do
        within(".begin_judgement_phase_button") do
          expect(page).to have_content('Begin Judgement Phase')
        end
      end
    end

    context "and user is judges" do
      background do
        sign_in(@argument.judges.first)
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is witness" do
      background do
        sign_in(@witness)
        visit argument_path @argument
      end
      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is guest" do
      background do
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end
  end



###########################################################
  context "has less than Argument::BASE_NUM_JUDGES judges" do
    background do
      (Argument::BASE_NUM_JUDGES - 1).times do |n|
        @argument.judges << create(:user, user_name: "Judge_#{n}")
      end
    end

    context "and user is owner" do
      background do
        sign_in(@owner_user)
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is con_side" do
      background do
        sign_in(@con_side_user)
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is judges" do
      background do
        sign_in(@argument.judges.first)
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is witness" do
      background do
        sign_in(@witness)
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end

    context "and user is guest" do
      background do
        visit argument_path @argument
      end

      include_examples "user can not see 'Begin Judgement Phase'"
    end
  end

end
