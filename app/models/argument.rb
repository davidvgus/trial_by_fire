class Argument < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  belongs_to :con_side, class_name: "User"
  has_one :essay

  validates_presence_of :owner_id
  validates_presence_of :con_side_id
  validates_presence_of :essay

  enum status: { being_critiqued: 0, submitted_to_judgement: 1, being_judged: 2, complete: 3}

end
