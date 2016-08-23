Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions, only: [:index, :show] do
    resources :bets, only: [:new, :create, :update]
  end

  namespace :dashboard do
      resources :statistics
      resources :questions
      resources :bets
      get 'history', to: 'histories#index'
    end

end
