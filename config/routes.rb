# frozen_string_literal: true

Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :guests, only: %i[create]
end
