Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :destroy]
  root "events#dashboard"
  # resources :appointments, only: [:index, :new, :create, :destroy]
  # root "appointments#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
