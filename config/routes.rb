Rails.application.routes.draw do
  devise_for :users
  root to: "seichis#index"
  resources :seichis, only: [:index, :new, :create, :show, :edit, :update]
end
