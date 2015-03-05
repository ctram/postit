module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end
  
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
