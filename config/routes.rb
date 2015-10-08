Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: :show
  resources :groups, only: [:index, :show, :edit, :update, :new, :create] do
    resources :tasks, only: [:new, :create]
    resources :memberships, only: [:index, :create] do
      get :autocomplete_user_email, on: :collection
    end
  end
  resources :tasks, only: [:index, :show, :create] do
    resources :memberships, only: [:index, :create]
  end
  resources :contacts, only: [:index, :show]
end
