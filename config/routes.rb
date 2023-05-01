Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get '/profiles/:username', to: 'profile#show', as: 'profile_show'
  get 'accounts/new'
  get 'accounts/create'
  get 'accounts/update'
  get 'home/index'

  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }

  resources :posts, only: [:new, :create, :index]

  root to: "home#index"

  devise_scope :account do
    get '/accounts/sign_out', to: 'accounts/sessions#destroy'
  end
end
