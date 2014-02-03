MgapUser::Application.routes.draw do

  get "listados1/index", to: 'listados1#index', as: 'listados1'
  get "listados2/index", to: 'listados2#index', as: 'listados2'
  get "graficos1", to: 'graficos1#index', as: 'graficos1'
  get "graficos2", to: 'graficos2#index', as: 'graficos2'
  get "proyectos_cerrados", to: 'proyectos_cerrados#index', as: 'proyectos_cerrados'
  get "proyectos_cerrados/:id", to: 'proyectos_cerrados#show', as: 'proyecto_cerrado'
  delete "proyectos_cerrados/:id", to: 'proyectos_cerrados#destroy'
  get "login", to: 'sessions#new', as: 'login'

  resources :clientes do
	  resources :lugares 
	  resources :responsables
  end

  resources :proyectos do
	  resources :tareas
	  member do
		  put 'cerrar'
	  end
  end

  resources :tareas do
	  member do
		  get 'copiar'
	  end
  end

  resources :tareas
  resources :users do
	  member do
		  put 'estado'
	  end
  end
  resources :tipo_tareas
  resources :sessions
  root 'sessions#new'
end
