Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'

  resources :suppliers

  namespace :suppliers, as: :supplier, path: '/:slug' do
    resources :items, path: "/supplies", only: [:index, :show]

    scope '/admin' do
      resources :orders, only: [:show, :index] do
        put 'pay', on: :member
        put 'cancel', on: :member
      end
      resources :categories, except: [:show]
      resources :items, path: "/supplies", only: [:new, :create, :edit, :update, :destroy] do
        member do
          put 'retire'
          put 'unretire'
        end
      end
      resources :suppliers, except: [:index, :show, :create, :new]
      resources :dashboard, only: [:index]
      get '/dashboard', to: "dashboard#index"
    end
  end

  resources :categories, only: [:index, :show], param: :catslug

  resources :orders

  resources :addresses

  resources :items, path: "/supplies"

  get 'register', to: 'users#new'
  resources :users
  get '/account_confirmation', to: 'users#account_confirmation'

  resources :password_resets

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items, path: "/cart"
  post '/cart_items/plus', to: "cart_items#plus"
  post '/cart_items/minus', to: "cart_items#minus"

  resources :charges

  get '/:slug', to: 'suppliers/items#index'

end
