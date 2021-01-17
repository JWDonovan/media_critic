# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'
  
  resources :movies
  resources :reviews

  resources :movies, only: [:show] do
    resources :reviews, only: [:new, :edit, :show]
  end
end
