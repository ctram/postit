class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password validations: false
  validate :password_does_not_match_password_confirmation, on: :update
  validates :username, presence: true, uniqueness: true

  validates :password, on: :create, presence: true, length: {minimum: 3}, confirmation: true
  validates :password, on: :update, confirmation:true, length: {minimum: 3}, allow_blank: true

  # XXX: This should work! 
  # validates :password, confirmation: true, unless: Proc.new {|a| a.password.blank?}

  validates :time_zone, presence: true


  def password_does_not_match_password_confirmation
    if !password.present? and password_confirmation.present?
      errors.add :password, "confirmation doesn't match Password"
    end
  end
end
