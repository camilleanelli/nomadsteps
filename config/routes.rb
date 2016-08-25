Rails.application.routes.draw do
  devise_for :users
  root 'trips#index'

  resources :trips, except: [:show] do
    resources :transportations do
      resources :tickets, only: [:new, :create, :destroy]
    end
    resources :accomodations, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :import_nomad_lists


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
