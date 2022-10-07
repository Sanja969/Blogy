Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, on: :show, only: [:index, :show, :destroy]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  namespace :api do 
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :new, :create] do
          end
        end
      end
    end
  end
end
