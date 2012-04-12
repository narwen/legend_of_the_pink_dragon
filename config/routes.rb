LegendOfThePinkDragon::Application.routes.draw do
  match "/sign_up", to: "users#new"

  resources :users, only: [:new, :create]
  
  root to: "welcome#index"
end
