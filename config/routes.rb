Rails.application.routes.draw do
  root to: "seichis#index"
  devise_for :users
  resources :seichis, only: [:index, :new, :create]
end
