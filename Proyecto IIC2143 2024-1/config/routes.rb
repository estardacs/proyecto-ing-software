Rails.application.routes.draw do
  get 'notifications/index'

  get 'chats/new'
  get 'chats/index'
  get 'chats/create'
  get 'chats/destroy'



  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  #rutas para pages
  get 'pages/perfil'
  get 'pages/buscar'
  get 'pages/posts'
  get 'pages/review', to: 'pages#review', as: 'pages_review'
  get 'pages/edit_perfil', to: 'pages#edit_perfil', as: 'edit_perfil'
  get 'tarjeta_usuario/:id', to: 'pages#tarjeta_usuario', as: 'tarjeta_usuario'
  patch 'pages/perfil', to: 'pages#update_perfil', as: 'update_perfil'
  get 'pages/guia_usuario'

  #crud chat
  resources :chats, only: [:index, :show, :destroy] do
    resources :messages, only: [:create]
  end

  #crud reviews
  resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'buscar'
    end
  end

  #crud posts
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  
  resources :notifications, only: [:index] do
    member do
      post 'mark_as_read'
    end
  end

  #crud notis
  resources :notifications, only: [:index]
  
  get '/buscar', to: 'pages#buscar', as: 'buscar_posts'
  post '/posts/:id/subscribe', to: 'posts#subscribe', as: 'subscribe_post'
  delete '/posts/:id/unsubscribe', to: 'posts#unsubscribe', as: 'unsubscribe_post'

end
