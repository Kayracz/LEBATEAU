Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'boats#index'

resources :boats, only: [:show, :new, :create] do
  resources :bookings, only: [:new, :create, :edit, :update]
end

resources :bookings, only: [:destroy]

end
