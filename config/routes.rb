Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'

  resources :suppliers

  namespace :suppliers, as: :supplier, path: '/:slug' do
    resources :orders
    resources :items, path: "/supplies"
  end

  resources :orders

  resources :addresses

  resources :items, path: "/supplies"

  resources :users

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items, path: "/cart"
  post '/cart_items/plus', to: "cart_items#plus"
  post '/cart_items/minus', to: "cart_items#minus"

  resources :charges

  get '/:slug', to: 'suppliers/items#index'

end
