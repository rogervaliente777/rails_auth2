Rails.application.routes.draw do
  # Namespace para Portal
  namespace :portal do
    #authentication
    get "/login", to: "authentication#login"
    post "/new_login", to: "authentication#new_login"
    get "/signup", to: "authentication#signup"
    post "/signup", to: "authentication#user_request"
    get "/validating_user", to: "authentication#validating_user"
    post "/signup_create", to: "authentication#signup_create"
    put "/logout", to: "authentication#logout"
    
    #home
    get "/home", to: "home#index"
  end

  # Namespace para Admin
  namespace :admin do
    # Ejemplo de rutas para un módulo Admin
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :dashboard, only: [:index]
  end

  # Ruta para pruebas (puedes eliminar o mover esto a un namespace si es necesario)
  resources :pruebas

  # Ruta para ver el estado de salud de la aplicación
  get "up", to: "rails/health#show", as: :rails_health_check

  # Define la ruta raíz de la aplicación
  root "portal/authentication#login" # Ajusta esto si tu página principal es el login del portal
end
