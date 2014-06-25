class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :user_name, presence: true, uniqueness: true

  has_many :essays
  has_many :arguments, foreign_key: "owner_id"
  has_many :con_arguments, foreign_key: "con_side"
end
