# TODO: Prevent user from voting on his own posts and comments?
# TODO: Add mailbox for each user
# TODO: User can send messages to each other
# TODO: Make comments voteable
# TODO: Comments and posts move up and down the ladder based on vote totals

# TODO: User must be logged in in order to vote -- lock on votes_controller actions.


# XXX: Chris coded voting by doing:
      # resources :posts, except: [:destroy] do
      #   member do
      #     post :vote
      #   end
      #
      #   resources :comments, only: [:create]
      # end
      #
      # resources :categories, only: [:new, :create, :show]

  # you added routes manually.
