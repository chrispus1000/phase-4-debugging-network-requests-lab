Rails.application.routes.draw do
  resources :toys, only: [:index,:show, :create, :update,:destroy]
end