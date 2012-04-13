LegendOfThePinkDragon::Application.routes.draw do
  match "/sign_up", to: "users#new"
  match "/sign_in", to: "sessions#new"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  root to: "welcome#index"
end
