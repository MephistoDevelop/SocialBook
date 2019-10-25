Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  devise_for :users
  get '/users' => 'users#index', as: :user_root # creates user_root_path
  get 'reactions/new' => 'reactions#new'
  post 'reactions/new' => 'reactions#create'
  post '/addlike', to: 'posts#add_like', as: 'addlike'

  post '/addfriend', to: 'users#send_friend_request', as: 'addfriend'
  post '/cancelfriend', to: 'users#cancel_friend_request', as: 'cancelfriend'
  get '/friendrequests', to: 'users#friend_requests', as: 'friendrequests'
  post '/acceptfriend', to: 'users#accept_friend'
  post '/deletefriend', to: 'users#delete_friend'
  get '/friends',to: 'users#show_friends'
  resources :comments,only: [:new,:create]



  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy]
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
