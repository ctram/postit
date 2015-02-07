class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}
end
