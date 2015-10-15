Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: :show
  resources :groups do
    resources :tasks, only: [:new, :create, :destroy]
    resources :contacts, only: [:new, :create, :destroy]
    resources :memberships, only: [:index, :create]
    resources :attachments, only: [:new, :create, :destroy]
    resources :comments
  end
  resources :tasks do
    resources :memberships, only: [:index, :create]
    resources :comments
  end
  resources :contacts do
    resources :comments
  end
  resources :checkins, only: [:new, :create]
  resources :attachments, only: [:index, :create, :destroy]
end
