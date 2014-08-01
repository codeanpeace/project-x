Projectx::Application.routes.draw do
  root :to => 'search#index'

  post "search/grade"
  post "search/topic"

  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"
  post "update/:id" => "bundles#update", :as => "update_bundle"

  resources :users do
    member do
      get :activate
    end
  end

  resources :sessions
  resources :password_resets

  # post "user/:user_id/:favorited_type/favorite/:favorited_id" => "favorites#create", :as => "favorite"
  # post "favorite" => "favorites#create", :as => "favorite"
  post "favorite/:resource_id" => "favorites#create", :as => "favorite"
  get "favorites/resources/index" => "favorites#resources", :as => "favorite_resources"

 #  get "/standards/:grade" => 'standards#grade'
 #  # match "/standards/:grade" => redirect("/grades/:grade")
 #  # get "/grades/:subject" => 'grades#grade'
 #  get "/standards/:subject/:grade" => 'standards#topic'
 #  get "/standards/:subject/:grade/:topic" => 'standards#standard'
 #  get "/standards/:subject/:grade/:topic/:standard" => 'standards#resource'
 #  # get "/standards/:subject/:grade/:topic/:standard/:resource"  => "standards#url"
 # #resources :grades


  #resources :favorite_resources


  #resources :favorite_bundles

  post "new_bundle" => "bundles#new", :as => "new_bundle"
  get "make_bundle/:standards" => "bundles#make_bundle", :as => "make_bundle"
  post "create_bundle/:standards" => "bundles#create", :as => "create_bundle"


  resources :bundles, :except => [:new, :create, :update]


  #resources :resources


  resources :standards



  #resources :mentors


  #resources :learners


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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
