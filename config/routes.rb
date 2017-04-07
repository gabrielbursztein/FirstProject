Rails.application.routes.draw do
    devise_for :users
    resources :books
    resources :requests
    root 'books#index'
end
