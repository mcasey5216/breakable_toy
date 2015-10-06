Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: :show
  resources :groups, only: [:index, :show]
  resources :tasks, only: [:index, :show]
  resources :contacts, only: [:index, :show]
end
