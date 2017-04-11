Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "meals#index"
  resources :meals
  post '/ingredients', to: 'meals#create_new_ingredients', as: :ingredients
  resources :lists, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :list_meals, only: [:create]
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

end
