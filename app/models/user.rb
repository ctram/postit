class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :user_teams
  has_many :teams, through: :user_teams
end
