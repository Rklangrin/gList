Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "meals#index"
  resources :meals
  post '/new_ingredient', to: 'meals#new_ingredient', as: :new_ingredient
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

end
