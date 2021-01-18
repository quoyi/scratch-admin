# frozen_string_literal: true

namespace :admin do
  resources :organizations, :users

  root 'home#index'
end
