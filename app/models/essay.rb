class Essay < ActiveRecord::Base
  enum status: [:draft, :published]
  belongs_to :user
end
