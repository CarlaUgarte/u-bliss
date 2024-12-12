Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get 'mi_perfil', to: 'pages#my_profile', as: :my_profile
    resources :syllabuses do
    resources :syllabus_modules, controller: 'syllabuses_modules', only: %i[ new create ]
    resources :libraries, only: %i[ create destroy ]
  end
  resources :syllabus_modules, controller: 'syllabuses_modules', except: %i[ index show ] do
    resources :lectures, only: %i[ new create ]
  end
  resources :lectures, except: %i[ new create ] do
    resources :comments
  end
  # resources :comments, only: %i[ edit update destroy ]
  resources :libraries, only: :index


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
