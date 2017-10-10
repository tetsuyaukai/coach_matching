Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # root to: "contents#index"
  resources :agreements
  resources :users_sports
  resources :sports
  resources :places
  resources :contents
  resources :users
  resource :self
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
