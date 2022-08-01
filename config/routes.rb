Rails.application.routes.draw do
  devise_for :users, :path_prefix => "u"
  root to: "home#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :devices
end
