Rails.application.routes.draw do
  resources :tags
  resources :posts do
    resources :empathes, only: [:create, :destroy]
    resources :cheers, only: [:create, :destroy]
    collection do
      get :search
      get :new_posts
      get :old_posts
      get :empathy_posts
      get :cheer_posts
      get :tag_posts
    end
  end
  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    root to: "users/sessions#new"
    get "user/:id", :to => "users/registrations#show"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end