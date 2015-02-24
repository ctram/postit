PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # get '/posts', to: 'posts#show'
  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/posts/:id/up_vote_post', to: 'votes#up_vote_post', as: 'up_vote_post'
  get '/posts/:id/down_vote_post', to: 'votes#down_vote_post', as: 'down_vote_post'

  get '/posts/:id/up_vote_comment', to: 'votes#up_vote_comment', as: 'up_vote_comment'
  get '/comments/:id/down_vote_comment', to: 'votes#down_vote_comment', as: 'down_vote_comment'


  resources :posts, except: :destroy do
    resources :comments, only: :create
  end

  resources :categories, except: :destroy
  resources :users, only: [ :create, :show, :edit, :update]
end
