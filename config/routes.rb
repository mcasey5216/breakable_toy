Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: :show
  resources :groups, only: :index
  resources :tasks, only: :index
  resources :contacts, only: [:index, :show]
end
