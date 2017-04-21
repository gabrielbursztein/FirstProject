Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  ActiveAdmin.routes(self)
    devise_for :users, :controllers => { registrations: 'registrations' }
    root 'books#index'
    resources :requests, only: [:index, :create]
    resources :authors, only: [:create]
    resources :books, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
end
