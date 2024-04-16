Rails.application.routes.draw do
  resources :awards
  resources :account_awards
  resources :fire_department_memberships
  resources :fire_departments
  resources :districts
  resources :regions
  resources :members

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :members
      resources :fire_departments, only: [:index, :show]
      resources :account_awards, param: :account_id, only: [:show]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "members#index"
end
