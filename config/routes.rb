Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  root to: 'pages#home'
  resources :teddies, only: [:index, :show]
  # resources :orders, only: [:show, :create]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
