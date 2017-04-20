Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "meals#index"
  resources :meals do
    resources :ingredients, only: [:new, :create]
  end
  # post '/ingredients', to: 'meals#create_new_ingredients', as: :ingredients
  resources :lists, only: [:new, :edit, :create, :show, :update]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

end
