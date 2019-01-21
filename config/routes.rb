Rails.application.routes.draw do
  
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
  get '/contact_us' => 'requests#new', as: 'contact'
  get '/artists/:id' => 'users#show', as: 'artista'
end
