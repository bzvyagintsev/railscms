Rails.application.routes.draw do

  # Admin
  namespace :admin do
    root "static_pages#index"

    
    resources :pages do
     collection do
        post 'destroy_multiple'
      end
    end

    resources :pages_categories do
     collection do
        post 'destroy_multiple'
      end
    end

    resources :products do
      resources :assets, only: [:new, :create, :edit, :update]
     
      collection do
        post 'destroy_multiple'
      end
    end

    resources :products_categories do
     collection do
        post 'destroy_multiple'
      end
    end    

    resources :orders do
     collection do
        post 'destroy_multiple'
      end
    end
    
    resources :assets, defaults: {format: :json} do
     collection do
        post 'destroy_multiple'
      end
    end

    get 'settings', to: 'settings#index', as: :settings
    patch 'settings', to: 'settings#update', defaults: {format: :json}
    put 'settings', to: 'settings#update', defaults: {format: :json}

  end

  # Front
  resources :pages, only: [:show, :index]
  resources :products, only: [:show, :index]
  resources :products_categories, only: [:show, :index]

  resources :line_items
  # resources :carts

  resources :orders, only: [:new, :create]

  # Static pages
  get 'cart', to: 'static_pages#cart', as: :cart
  get 'about', to: 'static_pages#about', as: :about
  get 'contacts', to: 'contacts#new', as: :contacts
  post 'contacts', to: "contacts#create"

  root "static_pages#home"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
