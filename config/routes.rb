Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :suppliers

  namespace :suppliers, as: :supplier, path: '/:slug' do
    resources :orders
    resources :items, path: "/supplies"
  end

  get '/:slug', to: 'suppliers/items#index'

  resources :orders

  resources :addresses

  root 'pages#index'

  resources :items

  resources :users

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items
  post '/cart_items/plus', to: "cart_items#plus"
  post '/cart_items/minus', to: "cart_items#minus"

  resources :charges

end
