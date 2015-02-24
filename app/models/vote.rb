class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic:true
  # TODO: User can only change the total vote by +1 or -1 max.

  def Vote.sum_votes_by_user_by_voteable_id voteable_id, user
    user_votes = Vote.all.select do |vote|
      (vote.voteable_id == voteable_id) and (vote.user_id == user.id)
    end
    # return net votes by this user.
    net_votes = user_votes.reduce(0) do |memo,vote|

      if vote.vote
        memo += 1
      else
        memo -= 1
      end
    end
    net_votes
  end

end
