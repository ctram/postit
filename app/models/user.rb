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

  # FIXME: Something broken about password validations related to password confirmation.
  validates_confirmation_of :password, allow_blank: true
  # validates_presence_of :password_confirmation
  validates :time_zone, presence: true
end

# X - no password and no confirmation
# X - when there is a password but no confirmation
# when there is no password bu there is confirmation
  # Passes validations and does NOT update the user's password
