Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  devise_for :users
  get '/users' => 'users#index', as: :user_root # creates user_root_path

  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy]
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
