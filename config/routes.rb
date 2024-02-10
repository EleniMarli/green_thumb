Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'
  get '/helper', to: 'pages#helper'
  get '/calendar', to: 'pages#calendar'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'plants/search', to: 'plants#search'

  resources :plants, only: %i[create index show update destroy]
  resources :tasks, only: %i[index]
  resources :reminders, only: %i[new create edit update]

  resources :tasks do
    member do
      patch 'mark_done'
    end
  end
end
