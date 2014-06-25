class Argument < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  belongs_to :con_side, class_name: "User"

  validates_presence_of :owner_id
  validates_presence_of :con_side_id

  enum status: { :submitted => 0, :under_consideration => 1, :complete => 2 }

end
