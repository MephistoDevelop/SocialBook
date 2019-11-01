Rails.application.routes.draw do
  #devise_for :users
  get 'users/new'
  get 'users/create'
  get 'users/show'


  get 'users', to: 'users#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #get '/users' => 'users#index', as: :user_root # creates user_root_path -> LINEA ELIMINADA
  root to: 'posts#index'
 # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
#  get '/auth/facebook/callback', to: 'sessions#create'
  get '/users/auth/failure', :to => 'users/omniauth#failure'
  #get '/users' => 'users#index', as: :user_root # creates user_root_path
  get 'reactions/new' => 'reactions#new'
  post 'reactions/new' => 'reactions#create'
  post '/addlike', to: 'posts#add_like', as: 'addlike'
  post '/addfriend', to: 'friendships#send_friend_request', as: 'addfriend'
  post '/cancelfriend', to: 'friendships#cancel_friend_request', as: 'cancelfriend'
  get '/friendrequests', to: 'friendships#friend_requests', as: 'friendrequests'
  post '/acceptfriend', to: 'friendships#accept_friend'
  post '/deletefriend', to: 'friendships#delete_friend'
  get '/friends',to: 'users#show_friends'

  resources :comments,only: [:new,:create]
  resources :posts, only: [:new, :create, :index, :show, :destroy]
end
