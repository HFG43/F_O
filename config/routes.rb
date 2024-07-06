Rails.application.routes.draw do
  resources :families, only: [:new, :create, :show, :index]
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "familyorganizer", to: "families#index" 
  root "families#index"
end
