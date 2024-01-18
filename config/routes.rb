Rails.application.routes.draw do
  devise_for :users
  root to: "seichis#index"
  resources :seichis do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
