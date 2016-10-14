Rails.application.routes.draw do
  resources :friendships, only: [:index, :new, :create, :destroy]

  root :controller => 'static', :action => '/'

  devise_for :users

  get 'complete_profile', to: "complete_profile#edit", as: "edit_complete_profile"
  patch 'complete_profile', to: "complete_profile#update", as: "complete_profile"

  get 'profile', to: "profile#edit", as: "edit_profile"
  patch 'profile', to: "profile#update", as: "profile"

  resources :trips, except: [:show] do
    resources :invitations, only: [:new, :create]

    resources :transportations do
      resources :tickets, only: [:new, :create, :destroy]
    end
    resources :accomodations
  end
  resources :import_nomad_lists

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
