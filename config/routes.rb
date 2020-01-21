Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes, except: :index
  resources :users, only: :show
end
