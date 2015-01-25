PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # get '/posts', to: 'posts#show'

  resources :posts, except: :destroy do
    resources :comments
  end

  resources :categories, except: :destroy

end
