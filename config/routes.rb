Rails.application.routes.draw do
  root 'application#index'
  # New Users
  get     'register'                =>  'users#new',        as: 'new_register'
  get     'users/new'               =>  'users#new'
  #Create Users
  post    'register'                =>  'users#create',     as: 'register'
  post    'users'                   =>  'usrs#create'
  post    'invitations'             => 'invitations#create'
  # Show Users
  get     'users'                    => 'users#index'
  get     'users/:id'                =>  'users#show',       as: 'user'
  get     'professional_profile'     => 'invitations#show'
  patch   'invitations/:id'          => 'invitations#update'
  
  # New Login
  get     'login'                   =>  'sessions#new',     as: 'new_login'
  get     'sessions/new'            =>  'sessions#new'
  # Login
  post    'login'                   =>  'sessions#create',  as: 'login'
  post    'sessions'                =>  'sessions#create'
  # Logout
  delete  'logout'                  =>  'sessions#destroy',  as: 'logout'
  delete  'sessions'                =>  'sessions#destroy'
  delete  'invitations/'             => 'invitations#destroy'
 
  
  

  # get "users" => "users#new", as: "users"
  # resources :users, except: [:index]
  # resources :sessions, only: [:new, :create, :destroy]
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
