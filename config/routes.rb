Rails.application.routes.draw do

  get 'users/show'
  root to: 'boats#index'
  devise_for :users

  resources :boats, only: [:show, :new, :edit, :update, :create, :destroy] do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]


end
