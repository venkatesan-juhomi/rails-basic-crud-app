Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  # resources :reviews, only: [:destroy]
  resources :movies do
    resources :reviews
  end
  resources :users, only: [:index, :show, :create]
  get '/signup', to: "users#new"

  # root 'movies#index'
  # get '/movies', to: 'movies#index'
  # get '/movies/new', to: 'movies#new'
  # get '/movies/:id', to: 'movies#show', as: :movie
  # post '/movies', to: 'movies#create'
  # get '/movies/:id/edit', to: 'movies#edit', as: :edit_movie
  # patch '/movies/:id', to: 'movies#update'
  # delete '/movies/:id', to: 'movies#destroy'
end
