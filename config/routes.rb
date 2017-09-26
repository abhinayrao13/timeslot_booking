Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :destroy]
  root "events#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
