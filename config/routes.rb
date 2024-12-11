Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resources :syllabuses do
    resources :syllabuses_modules, only: %i[ new create ]
    resources :libraries, only: :create
  end
  resources :syllabuses_modules, except: %i[ index show ] do
    resources :lectures, only: %i[ new create ]
  end
  resources :lectures, except: %i[ index show ] do
    resources :comments, only: %i[ new create ]
  end
  resources :comments, only: %i[ edit update destroy show index]
  resources :libraries, only: :index


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
