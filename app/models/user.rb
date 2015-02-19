class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true

  validates :password, on: :create, presence: true, length: {minimum: 3}
  validates :password, on: :update, length: {minimum: 3}, allow_blank: true

  # validates_confirmation_of :password, allow_blank: true
  validates :time_zone, presence: true
end
