Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  match 'home', to: "home#index", via: :get

  namespace :admin do
    match 'dashboard', to: 'dashboard#show', via: :get, as: :dashboard
  end

  namespace :agent do
    match 'dashboard', to: 'dashboard#show', via: :get, as: :dashboard
  end
end
