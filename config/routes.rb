Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get "users/:id/likes", to: "users#like"
  resources :users, only: [:index, :show, :new, :create] do
  
    member do
      get :followings
      get :followers
      
      get :pettings
      get :peters
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  resources :likes, only: [:create, :destroy]
end 