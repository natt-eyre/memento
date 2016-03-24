Rails.application.routes.draw do
  devise_for :users
  root to: "entries#index"
  resources :entries, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  get 'results', to: 'results#index', as: 'results'
  resource :stats, only: [:show]
end
