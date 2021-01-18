# frozen_string_literal: true

namespace :admin do
  resources :organizations

  root 'home#index'
end
