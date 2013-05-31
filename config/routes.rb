USERNAME_ROUTE_FORMAT = /[A-Za-z0-9\_]+/ unless defined? USERNAME_ROUTE_FORMAT

Baiwale::Application.routes.draw do

  get "topics/show"

  get "topics/new"

  get "topics/create"

  get "topics/edit"

  get "topics/destory"

  resources :users do
    collection do
      put 'modify_password/:id' => 'users#modify_password'
    end
  end
  resources :discussions, id: USERNAME_ROUTE_FORMAT

  resources :topics do
    collection do
      post 'replay' => 'topics#replay'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  match "/about" => "home#about"
  match "/contact" => "home#contact"
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/signup', to: 'users#new'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  namespace :admin do
    get '/', :to => 'bpanel#index', :as => 'bpanel'
    resources :discussions
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'discussions#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
