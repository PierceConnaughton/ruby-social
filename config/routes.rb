Rails.application.routes.draw do
  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  get 'accounts/new'
  get 'accounts/create'
  get 'accounts/edit'
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
