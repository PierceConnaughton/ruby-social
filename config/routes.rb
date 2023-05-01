Rails.application.routes.draw do
  get '/profiles/:username', to: 'profile#show', as: 'profile_show'
  get 'accounts/new'
  get 'accounts/create'
  get 'accounts/update'
  get 'home/index'
  
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }

  

  
  root to: "home#index"

  devise_scope :account do
    get '/accounts/sign_out', to: 'accounts/sessions#destroy'
  end
  
end
