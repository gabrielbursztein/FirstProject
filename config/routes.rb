Rails.application.routes.draw do
    devise_for :users
    root 'books#index'
    resources :books, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
end
