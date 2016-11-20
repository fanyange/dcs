Rails.application.routes.draw do
  resources :instructions
  resources :leaders
  resources :documents do
    resources :locations
    resources :instructions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
