Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get '/cart_info' => "cart_items#cart_status"
  resources :suppliers

  # namespace :admin do
  #   resources :suppliers do
  #     resources :items
  #   end
      # resources :orders
  # end

  namespace :suppliers, as: :supplier, path: '/:slug' do
    resources :orders
    resources :items, path: "/supplies"
  end


  resources :addresses

  resources :items, path: "/supplies"

  resources :users do
    resources :orders
  end


  get '/new_supplier_user', to: "users#new_supplier_user"
  post '/new_supplier_user', to: "users#create_supplier_user"

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items, path: "/cart"
  post '/cart_items/plus', to: "cart_items#plus"
  post '/cart_items/minus', to: "cart_items#minus"

  resources :charges

  get '/:slug', to: 'suppliers/items#index'

end
