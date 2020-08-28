Rails.application.routes.draw do
  devise_for :users
  resources :locations
  resources :customers
  resources :appointments  
  root to: 'appointments#calendar'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
