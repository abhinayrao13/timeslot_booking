Rails.application.routes.draw do
  resources :appointments
  root "appointments#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
