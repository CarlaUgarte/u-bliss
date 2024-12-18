Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get 'about_us', to: 'pages#show', id: 'about_us', as: :about_us

  get 'mi_perfil', to: 'pages#my_profile', as: :my_profile

  patch 'mi_perfil', to: 'pages#update_profile'
  resources :users, only: :destroy

    resources :syllabuses do
    resources :syllabus_modules, controller: 'syllabuses_modules', only: %i[ new create ]
    resources :libraries, only: %i[ create destroy ]
    resources :reviews, only: :create
  end
  resources :syllabus_modules, controller: 'syllabuses_modules', except: %i[ index show ] do
    resources :lectures, only: %i[ new create ]
  end
  resources :lectures, except: %i[ new create ] do
    resources :comments
  end
  # resources :comments, only: %i[ edit update destroy ]
  resources :libraries, only: :index


  #gamificaion
  post 'tasks/complete_task', to: 'tasks#complete_task', as: 'complete_task'
  #post 'tasks/toggle_complete', to: 'tasks#toggle_complete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
