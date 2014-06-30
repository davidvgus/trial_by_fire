class Argument < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  belongs_to :con_side, class_name: "User"
  has_one :essay
  has_many :judgeships
  has_many :judges, through: :judgeships, source: :user
  has_many :votes

  validates_presence_of :owner_id
  validates_presence_of :con_side_id
  validates_presence_of :essay

  enum status: { being_critiqued: 0, selecting_judges: 10, being_judged: 20, complete: 30}

  BASE_NUM_JUDGES = 5

  def has_judge?(user)
    self.judges.include?(user)
  end

  def eligible_judges
    excluded = [self.owner, self.con_side]
    User.eligible_judges(excluded)
  end

  def get_current_user_role(user)
    if (user == self.owner)
      "Owner"
    elsif (user == self.con_side)
      "Con Side"
    elsif self.judges.include?(user)
      "Judge"
    else
      "Witness"
    end
  end

end
