Rails.application.routes.draw do
  devise_for :users
  resources :items,      only: [:create, :new, :index]
  resources :categories, only: [:create, :new, :index]
  resource  :user,       only: [:show]

  scope module: :users, path: 'users' do
    resource :account_informations, only: [:edit, :update]
    resource :change_passwords,     only: [:edit, :update]
  end

  root to: 'items#index'
end
