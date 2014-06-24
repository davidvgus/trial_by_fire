class Argument < ActiveRecord::Base

  enum status: { :submitted => 0, :under_consideration => 1, :complete => 2 }
end
