Rails.application.routes.draw do
  get 'homepages/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homepages#index"
  resources :listings, only: [:index, :show, :new, :create, :edit, :update]
  resources :bookings, except: [:edit, :destroy]
  resources :homepages
end
