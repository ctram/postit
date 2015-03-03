class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :user_id, presence: true
  validates :url, presence: true
  validates :description, presence: true

  def net_votes
    self.votes.reduce(0) do |m,v|
      if v.vote
       m + 1
      else
       m - 1
      end
    end
   # return the net number of votes for Post object.
  end

end
