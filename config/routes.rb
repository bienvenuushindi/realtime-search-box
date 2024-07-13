Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  root "searches#index"
  resources :articles
  resources :searches, only: [:new, :create, :index]
  get "up" => "rails/health#show", as: :rails_health_check
end
