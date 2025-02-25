# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords]

  root 'home#index' 
  resources :gallery, only: [:index]
  resources :rsvps, only: [:new, :edit, :create, :update]

  get "/admin", to: "admin#index"
  namespace :admin do
    resources :rsvps, only: [:show, :destroy]
  end
end
