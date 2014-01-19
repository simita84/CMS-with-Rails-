MomsAndTots::Application.routes.draw do
  get "invitees/index"

  get "invitees/new"

  get "invitees/eventinfo"

  get "invitees/editInvitee"

  get "invitees/sendEventInvite"

  get "invitees/memberResponseHandler"

  get "invitees/deleteInvitee"

  get "events/index"

  get "events/listEvents"

  get "events/newEvents"

  get "events/showEvents"

  get "events/editEvents"

  get "events/deleteEvents"

  get "reviews/list"

  get "reviews/edit"

  get "reviews/delete"

  get "reviews/newReviews"

  get "products/index"

  get "products/list"

  get "products/new"

  get "products/edit"

  get "products/delete"

  resources :contacts


  resources :admins

  resources :homes
 
  resources :items


  resources :recipes


  resources :products
  
root :to =>"public#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
