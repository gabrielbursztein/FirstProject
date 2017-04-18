Rails.application.routes.draw do

  ActiveAdmin.routes(self)
    devise_for :users
    root 'books#index'
    resources :requests, only: [:index, :create]
    resources :authors, only: [:create]
    resources :books, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
end
