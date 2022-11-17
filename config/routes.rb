Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies do
    collection do
      get 'list'
    end
  end
  resources :bookmarks, only: %i[create new destroy]
end
