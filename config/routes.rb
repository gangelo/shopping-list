# frozen_string_literal: true

Rails.application.routes.draw do
  resources :measurements
  # Defines the root path route ("/")
  root 'home#index'

  scope module: :admin do
    resources :items, as: 'admin_items', path: 'admin/items'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
