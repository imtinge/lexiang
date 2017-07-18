Rails.application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :users
  resources :sessions
  resources :games, only: [:index, :show]
  namespace :admin do
    resources :games
  end
  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
