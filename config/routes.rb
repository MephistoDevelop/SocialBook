Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'user/:id', to: 'users#show', as: 'user'
  get 'user/edit/:id', to: 'users#edit', as: 'edit'
  post 'user/edit/:id', to: 'users#update'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'posts#index'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/users/auth/failure', :to => 'users/omniauth#failure'
  get 'reactions/new' => 'reactions#new'
  post 'reactions/new' => 'reactions#create'
  post '/addlike', to: 'posts#add_like', as: 'addlike'
  post '/addlike_post', to: 'posts#add_like_post', as: 'addlikepost'
  post '/addfriend', to: 'friendships#send_friend_request', as: 'addfriend'
  post '/cancelfriend', to: 'friendships#cancel_friend_request', as: 'cancelfriend'
  get '/friendrequests', to: 'friendships#friend_requests', as: 'friendrequests'
  post '/acceptfriend', to: 'friendships#accept_friend'
  post '/deletefriend', to: 'friendships#delete_friend'
  get '/friends',to: 'users#friends'

  resources :comments,only: [:new,:create]
  resources :posts, only: [:new, :create, :index, :show, :destroy]
end
