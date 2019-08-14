Rails.application.routes.draw do
  devise_for :users

  resources :items,      only: [:index, :new, :create, :edit, :update, :destroy]
  resources :builds,     only: [:index, :new, :create, :edit, :update, :destroy]
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :employees,  only: [:index, :new, :create, :edit, :update, :destroy]
  resources :dashboard,  only: [:index]
  resource  :user,       only: [:show]

  scope module: :users, path: 'users' do
    resource :account_informations, only: [:edit, :update]
    resource :change_passwords,     only: [:edit, :update]
  end

  root to: 'dashboard#index'
end
