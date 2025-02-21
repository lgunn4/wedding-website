# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index' 
  resources :gallery, only: [:index]
  resources :rsvps, only: [:new, :edit, :create, :update]

  get "/admin", to: "admin#index"
  namespace :admin do
    resources :rsvps, only: [:show]
  end
end
