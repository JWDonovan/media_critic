# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  get '/movies/highest_rated', action: :highest_rated, controller: 'movies'

  resources :movies
  resources :reviews

  resources :movies, only: [:show] do
    resources :reviews, only: %i[new edit show index]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :edit, :update, :destroy]
end
