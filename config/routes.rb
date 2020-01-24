Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'

  namespace :notes do
    resources :searches, only: :index
  end

  resources :notes, except: :index do
    resources :comments, only: :create
  end

  resources :tags, only: [:index, :create, :show]
  resources :users, only: :show

  post   '/like/:note_id' => 'likes#like',   as: 'like'
  delete '/like/:note_id' => 'likes#unlike', as: 'unlike'
end
