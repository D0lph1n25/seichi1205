Rails.application.routes.draw do
  devise_for :users
  root to: "seichis#index"
  resources :seichis
  resources :users, only: :show
end
