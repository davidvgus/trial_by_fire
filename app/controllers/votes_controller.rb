class VotesController < ApplicationController
  before_filter :setup

  def upvote
    update_vote("affirmative!")
    redirect_to :back
  end

  def downvote
    update_vote("negative!")
    redirect_to :back
  end
  private

  def setup
    @argument = Argument.find(params[:argument_id])
    @user = User.find(params[:user_id])
    @vote = Vote.where(argument_id: @argument.id, user_id: @user.id).first
  end

  def update_vote(state)
    if @vote
      @vote.send(state)
    else
      @vote = current_user.votes.create(argument: @argument)
      @vote.send(state)
    end
    flash[:notice]= "vote cast as #{state}"
  end
end
