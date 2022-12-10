# frozen_string_literal: true

Rails.application.routes.draw do
  get 'p/:id', to: 'profile#show'

  post 'profile/follow', to: 'profile#follow'
  post 'profile/unfollow', to: 'profile#unfollow'

  devise_scope :user do
    # Redirects signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
