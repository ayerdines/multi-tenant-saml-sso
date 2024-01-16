Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'pages#show', id: 'home'

  devise_for :users

  devise_scope :user do
    match '/users/auth/saml/:org_slug/callback',
          via: [:get, :post],
          to: 'users/omniauth_callbacks#saml',
          as: 'user_omniauth_callback'
  end

  resources :authenticated, only: [:index]

  get "/*id" => 'pages#show', as: :page, format: false
end
