class Judgeship < ActiveRecord::Base
  belongs_to :user
  belongs_to :argument

  validates_presence_of :user
  validates_presence_of :argument
end
