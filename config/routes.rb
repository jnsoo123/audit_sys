Rails.application.routes.draw do
  resources :items, only: [:create, :new, :index]
  resources :categories, only: [:create, :new, :index]

  root to: 'items#index'
end
