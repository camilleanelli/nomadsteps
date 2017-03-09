Rails.application.routes.draw do

  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

  get 'dashboard', to: 'dashboard#show', as: "dashboard"

  resources :friendships, except: [:show, :edit, :update]

  root :controller => 'static', :action => '/'

  devise_for :users

  get 'complete_profile', to: "complete_profile#edit", as: "edit_complete_profile"
  patch 'complete_profile', to: "complete_profile#update", as: "complete_profile"


  get 'profile', to: "profile#edit", as: "edit_profile"
  patch 'profile', to: "profile#update", as: "profile"

  namespace :admin do
    resources :users
  end

  get 'public_profile/:user_id', to: "public_profile#show", as: "public_profile"
  resources :trips, except: [:show] do
    resources :transportations, except: [:show] do
      resources :tickets, only: [:new, :create, :destroy]
    end
    resources :accomodations
  end
  resources :import_nomad_lists

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
