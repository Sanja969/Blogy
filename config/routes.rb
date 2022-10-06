Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, on: :show, only: [:index, :show, :destroy]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end
end
