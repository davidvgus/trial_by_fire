class Argument < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  belongs_to :con_side, class_name: "User"
  has_one :essay
  has_many :judgeships
  has_many :judges, through: :judgeships, source: :user

  validates_presence_of :owner_id
  validates_presence_of :con_side_id
  validates_presence_of :essay

  enum status: { being_critiqued: 0, selecting_judges: 10, submitted_to_judgement: 20, being_judged: 30, complete: 40}

end
