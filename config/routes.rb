Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # need devise only for login
  devise_for :users, only: [:sessions]
  resources :credentials do
    get 'show_password', on: :member
    get 'hide_password', on: :member
    get 'fetch_password', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'credentials#index'
  # resources :users, only: [:create]
end
