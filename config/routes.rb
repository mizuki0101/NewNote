Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  namespace :notes do
    resources :searches, only: :index
  end
  resources :notes, except: :index do
    resources :comments, only: :create
    resources :tags, only: [:index, :create]
  end
  resources :users, only: :show
end
