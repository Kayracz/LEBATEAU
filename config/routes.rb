Rails.application.routes.draw do

  root to: 'boats#index'
  devise_for :users

  resources :boats, only: [:show, :new, :create] do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]

end
