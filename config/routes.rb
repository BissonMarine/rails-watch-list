Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index'
  resources :movies, only: %i[index show]
  # resources :movies
  # resources :bookmarks
  resources :lists do
    resources :bookmarks, only: %i[create new]
  end

  resources :bookmarks, only: %i[destroy]
end
