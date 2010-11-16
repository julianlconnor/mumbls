AuthlogicRails3Example::Application.routes.draw do |map|
  resources :housings

  get "activations/new"

  get "activations/create"

  resources :listings

  get "home/index"

  resources :users
  
  get    'login(.:format)'  => 'user_session#new',     :as => :login
  post   'login(.:format)'  => 'user_session#create',  :as => :login
  delete 'logout(.:format)' => 'user_session#destroy', :as => :logout

  root :to => 'home#index' # login page
  
  match '/register/:activation_code' => 'activations#new'
  match '/activate/:activation_code' => 'activations#create'
  
  # Route for showing users
  match '/profile/:alias' => 'users#show_profile'
  
  # Route for user dashboards
  match '/home/dashboard', :to => 'home#dashboard'
  
  # Route for easily viewing listings
  match '/:listings/:id' => 'listings#show'
  
  # Start routes for listings
  match '/listings/category/:nam' => 'listings#list_by_category', :id => 1
  match '/listings/category/furniture' => 'listings#list_by_category', :id => 2
  match '/listings/category/electronics' => 'listings#list_by_category', :id => 3
  match '/listings/category/textbooks' => 'listings#list_by_category', :id => 4
  match '/listings/category/sports-equipment' => 'listings#list_by_category', :id => 5
  match '/listings/category/video-games' => 'listings#list_by_category', :id => 6
  match '/listings/category/co-op' => 'listings#list_by_category', :id => 7
  match '/listings/category/internship' => 'listings#list_by_category', :id => 8
  match '/listings/category/part-time' => 'listings#list_by_category', :id => 9
  match '/listings/category/full-time' => 'listings#list_by_category', :id => 10
  match '/listings/category/services' => 'listings#list_by_category', :id => 11
  match '/housings/category/apartments-2-br' => 'listings#list_by_category', :id => 12
  match '/housings/category/apartments-3-br' => 'listings#list_by_category', :id => 13
  match '/housings/category/apartments-4-br' => 'listings#list_by_category', :id => 14
  match '/housings/category/sublet-short-term' => 'listings#list_by_category', :id => 15
  # End Routes for listings
  
  
  # Start routes for searches
  match 'homesearch', :to => 'home#search'
  match 'listingsearch', :to => 'listings#search'
  match 'housingsearch', :to => 'housings#search'
  # End routes for searches
  
  
  match 'logout', :to => 'user_session#destroy', :as => :logout
  match 'resend_form', :to => 'activations#resend_form', :as => 'resend_form'
  match 'resend_activation', :to => 'activations#resend_activation', :as => 'resend_activation'
  
  map.activate 'activate', :controller => 'activations'

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
