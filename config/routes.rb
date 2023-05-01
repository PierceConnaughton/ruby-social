Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get '/profiles/:username', to: 'profile#show', as: 'profile_show'
  get 'accounts/new'
  get 'accounts/create'
  get 'accounts/update'
  get 'home/index'

  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }

  resources :posts, only: [:new, :create, :index, :show]

  resources :follows, only: [:create, :destroy]


  post 'follow/:id' => 'follows#follow', as: 'follow_account'
  delete 'follow/:id' => 'follows#unfollow', as: 'unfollow_account'

  get 'profile/:id', to: 'profile#show', as: 'profile'

  

  root to: "home#index"

  devise_scope :account do
    get '/accounts/sign_out', to: 'accounts/sessions#destroy'
  end
end
