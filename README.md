== README

Trial by Fire is a short form debate project written as an assignment for the Bloc.io full stack development course.  The purpose of the app is to have a strictly moderated one round, two person debate.  The workflow has an authenticated user writinge one or more essays then selecting one of the essays to serve as the subject of the debate.  The essay should be stated in the form of a truth statement or motion.  The user then creates an argument by selecting an opponent.  The opponent then reads the original essay and forumlates a response and transitions the argument to the judge selection phase.  The two users then both assign judges. Once at least 5 judges have been chosen (configurable in: Argument::BASE_NUM_JUDGES) the argument can be transitioned into the judging phase.  In the judging phase judges vote and the process is complete when the last judge casts his/her vote.

* Ruby version
2.0.0

* System dependencies:
See Gemfile

