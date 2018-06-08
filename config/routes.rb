Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :likes
  resources :peliculas
  resources :categories
  
  root to:"peliculas#index"
end
