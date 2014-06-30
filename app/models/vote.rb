class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :argument

  validates_presence_of :user
  validates_presence_of :argument

  STATUS_OPTIONS = %w(negative affirmative)
  validates :status, :inclusion => {:in => STATUS_OPTIONS}

  enum status: { negative: 0, affirmative: 1}
end
