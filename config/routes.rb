Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  match 'home', to: "home#index", via: :get
end
