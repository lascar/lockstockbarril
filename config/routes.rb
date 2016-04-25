require 'api_constraints'
Rails.application.routes.draw do
  get 'web/welcome'

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true), defaults: { format: :json } do
      resources :articles
      resources :brands
      resources :suppliers do
        resources :addresses
      end
      resources :supplies
      resources :supplies_in_warehouse
      post '/warehouses/:id/add_supply', to: 'warehouses#add_supply'
      delete '/warehouses/:id/remove_supply/:supply_in_warehouse_id', to: 'warehouses#remove_supply'
      resources :warehouses do
        resources :addresses
      end
      resources :locations
      resources :addresses
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:show, :create, :update, :destroy]
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2), defaults: { format: :json } do
    end
  end
 
  root controller: 'web', action: :welcome
end
