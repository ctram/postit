class Comment < ActiveRecord::Base
  include Voteable
  
  belongs_to :user
  belongs_to :post
  # has_many :votes, as: :voteable
  validates :body, presence: true


  # def net_votes
  #   self.votes.reduce(0) do |m,v|
  #     if v.vote
  #       m + 1
  #     else
  #       m - 1
  #     end
  #   end
  #   # return the net number of votes for Post object.
  # end


end
