# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :permissions
  end
  resources :permissions
  draw :admin

  devise_for :users
  resources :users

  root 'home#index'
end
