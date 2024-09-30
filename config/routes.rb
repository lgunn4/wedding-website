# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :guests, only: %i[create]
  resources :gallery, only: [:index]
end
