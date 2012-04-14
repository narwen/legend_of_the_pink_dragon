LegendOfThePinkDragon::Application.routes.draw do
  match "/sign_up", to: "users#new"
  match "/sign_in", to: "sessions#new"
  match "/sign_out", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: "welcome#index"

  namespace :admin do
    resources :locations, only: [:new, :create, :show]
  end
end
