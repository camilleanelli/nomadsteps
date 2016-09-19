Rails.application.routes.draw do
  
  root "trips#index"

  devise_for :users, :controllers => { :invitations => 'invitations' }

  resources :trips, except: [:show] do
    resources :transportations do
      resources :tickets, only: [:new, :create, :destroy]
    end
    resources :accomodations
    end
  resources :import_nomad_lists


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
