Rails.application.routes.draw do
  # this are my routes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#homepage'
  get 'welcome/homepage'
  # get '/portal' => 'sessions#new', as: nil
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  resources :users
  resources :requests
  resources :businesses
  resources :business_hours
  get '/contact_us' => 'requests#new', as: 'contact'
  get '/artists/:id' => 'users#show', as: 'artista'
  # this is the end of my routes

  get '/register' => 'users#registration', as: 'sign_up'
  put '/users' =>'users#new_staff', as: nil
end