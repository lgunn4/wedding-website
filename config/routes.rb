# frozen_string_literal: true

Rails.application.routes.draw do
  get 'galleries/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :guests, only: %i[create]
  get 'gallery', to: 'galleries#show'
end
