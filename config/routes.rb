MgapUser::Application.routes.draw do


  get "listados6/index"
  get "listados1/index", to: 'listados1#index', as: 'listados1'
  get "listados2/index", to: 'listados2#index', as: 'listados2'
  get "listados3/index", to: 'listados3#index', as: 'listados3'
  get "listados4/index", to: 'listados4#index', as: 'listados4'
  get "listados5/index", to: 'listados5#index', as: 'listados5'
  get "listados6/index", to: 'listados6#index', as: 'listados6'
  resources :otros

  resources :etapas

  resources :modulos

  #resources :responsables

  get "graficos/index"
  get "reportes1/index", to: 'reportes1#index', as: 'reportes1'
  get "reportes/index", to: 'reportes#index', as: 'reportes'
  get "home/index"

  resources :clientes do
	  resources :lugares 
	  resources :responsables
  end

  resources :proyectos do
	  resources :tareas
  end

  resources :tareas
  resources :users
  resources :sessions

  root 'home#index'
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
