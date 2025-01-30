Rails.application.routes.draw do
  devise_for :users
  root to: "viri#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :viri, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create] do
      collection do
        get :calculate_price
      end
    end

    # Routes imbriquées pour les reviews
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
end
