Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'


  resources :prototypes, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:new, :create, :edit, :update, :destroy]

  end
  resources :users, only: [:show, :edit, :update]
end
