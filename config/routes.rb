Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'static_pages/home'
  get '/signup', to: 'users#new'

  root to: 'static_pages#home'
  resources :users
  resources :instructions
  resources :leaders
  resources :documents do
    collection do
      get 'all', to: 'documents#all_index'
    end
    resources :locations
    resources :instructions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
