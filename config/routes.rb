Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  devise_for :users
  get '/users' => 'users#index', as: :user_root # creates user_root_path
  get 'reactions/new' => 'reactions#new'
  post 'reactions/new' => 'reactions#create'
  post '/addlike', to: 'posts#add_like', as: 'addlike'
  post '/dislike', to: 'posts#add_dislike', as: 'add_dislike'



  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy]
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
