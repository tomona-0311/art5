Rails.application.routes.draw do
  get 'pages/home'
  get 'users/account'
  get 'users/profile'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :user do
    root to: 'users/registrations#new'
  end
  get 'posts/index'
  #resources :users, only: :show
  get "/", to: "devise/registrations#new"
  resources :posts
  resources :comments

  resources :posts do  #postsコントローラへのルーティング
    resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end
  #resources :posts do
   # resources :displays
 # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
