# frozen_string_literal: true

namespace :admin do
  resources :categories, :materials, :courses
  resources :organizations, :roles, :permissions, :users

  root 'home#index'
end
