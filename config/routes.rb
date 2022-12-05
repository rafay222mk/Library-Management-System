# frozen_string_literal: true

Rails.application.routes.draw do
  get 'studenta/index'
  get 'studenta/show'

  get 'welcome/home'

  devise_for :users

  resources :books do
    collection do
      post :import
    end
  end
  resources :users do
    member do
      get :showbh
    end
  end
  resources :borrow_histories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#home'
end
