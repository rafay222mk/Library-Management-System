# frozen_string_literal: true

Rails.application.routes.draw do

  get 'welcome/home'

  devise_for :users , controllers: { registrations: "user/registrations" }

  resources :books do
    collection do
      post :import
    end
  end
  resources :users do
    resources :addresses
    member do
      get :showbh
    end
  end
  resources :borrow_histories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#home'
end
