Rails.application.routes.draw do
  devise_for :users
  resources :locations
  resources :customers
  resources :appointments  
  get '/calendar', to: 'appointments#calendar', as: "calendar"
  root to: 'appointments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
