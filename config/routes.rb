Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get '/profiles/:username/followers', to: 'profile#followers', as: 'profile_followers'
  get '/profiles/:username/following', to: 'profile#following', as: 'profile_following'
  get '/profiles/search', to: 'profile#search', as: 'profile_search'
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
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  root to: "home#index"

  devise_scope :account do
    get '/accounts/sign_out', to: 'accounts/sessions#destroy'
  end
end
