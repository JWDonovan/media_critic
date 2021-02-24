# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  resources :movies
  resources :reviews

  resources :movies, only: [:show] do
    resources :reviews, only: %i[new edit show index]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
