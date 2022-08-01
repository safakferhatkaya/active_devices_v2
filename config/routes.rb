Rails.application.routes.draw do
  devise_for :users, :path_prefix => "u"
  root to: "home#index"
end
