require 'api_constraints'
Rails.application.routes.draw do
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
  devise_for :users, only: []
 
  root controller: 'api/v1/articles', action: :index
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
