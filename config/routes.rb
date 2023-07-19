Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  devise_scope :user do
    root to: 'users/registrations#new'
  end
  get 'posts/index'
  #resources :users, only: :show
  get "/", to: "devise/registrations#new"
  resources :posts
  resources :displays
  resources :posts do  #postsコントローラへのルーティング
    resources :displays, only: [:create]  #displaysコントローラへのルーティング
  end
  #resources :posts do
   # resources :displays
 # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
