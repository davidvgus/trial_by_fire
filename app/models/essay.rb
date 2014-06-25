class Essay < ActiveRecord::Base
  enum status: [:draft, :published]
  belongs_to :user
  belongs_to :argument

  validates_presence_of :title, message: "Title can not be blank."
  validates_presence_of :description, message: "Description can not be blank."
  validates_presence_of :body, message: "Body can not be blank."
  validates_presence_of :user_id, message: "Must be assigned to user."
end
