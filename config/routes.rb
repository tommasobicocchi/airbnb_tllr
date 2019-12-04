Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index]
  end
  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end
end
