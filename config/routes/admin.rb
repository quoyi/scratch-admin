# frozen_string_literal: true

namespace :admin do
  resources :organizations, :roles, :users

  root 'home#index'
end
