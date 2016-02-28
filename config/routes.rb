Rails.application.routes.draw do
  devise_for :users
  root to: "entries#index"
  resources :entries, only: [:new, :index, :create, :show]
end
