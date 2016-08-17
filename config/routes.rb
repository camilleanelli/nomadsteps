Rails.application.routes.draw do
  devise_for :users
  root 'trips#index'

  resources :trips, only: [:index, :edit, :update, :new, :create, :destroy] do
    resources :transportations
  end
  resources :import_nomad_lists


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
