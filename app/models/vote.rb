class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic:true

  def Vote.sum_votes_by_user_by_voteable_id voteable_id, user
    user_votes = Vote.all.select do |vote|
      (vote.voteable_id == voteable_id) and (vote.user_id == user.id)
    end
    # return net votes by this user.
    if user_votes == []
      return 0
    else
      net_votes = user_votes.reduce(0) do |memo,vote|
        if vote.vote
          memo += 1
        elsif !vote.vote
          memo -= 1
        else
          memo += 0
        end
      end
    end
  end
end
