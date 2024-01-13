Rails.application.routes.draw do

  resources :farmers

  resources :products
  resources :races
  resources :categories
  get 'farmers/index'
  get 'farmers/show'
  get 'farmers/new'
  get 'farmers/edit'
  get 'farmers/create'
  get 'farmers/update'
  get 'farmers/destroy'

  # Specify routes for devise
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "products#index"

end
