Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :cars
  end
    resources :events  do
    resources :enrollments 
      resources :comments
      resources :results
   end
    match '/attend/:id' => 'events#attend', via: :get
  # match '/attend/:id' => 'events#attend', via: :post
  #  match '/cancel/:id' => 'events#cancel', via: :get
  match '/cancel/:id' => 'events#cancel', via: :post
    match '/all' => 'users#all', via: :get
    match '/all' => 'users#all', via: :post
       match '/myevents' => 'users#myevents', via: :get
    match '/myevents' => 'users#myevents', via: :post
    match '/events/:id/comments/new' => 'comments#create', via: :post
      match '/events/:id/comments' => 'comments#index', via: :get
    match '/events/:id/comments/:id/edit' => 'comments#edit', via: :put
    match '/events/:id/like' => 'events#like', via: :post
     match '/events/:id/like' => 'events#like', via: :get
         match '/events/:id/unlike' => 'events#unlike', via: :post
     match '/events/:id/unlike' => 'events#unlike', via: :get
    match '/users/:id/cars/new' => 'cars#create', via: :post
     match '/events/:id/enrollments/:id'=> 'enrollments#destroy', via: :delete
     match '/users/:id/usercars' => 'users#usercars' , via: :get
     match '/users/:id/userevents' => 'users#userevents' , via: :get
    match '/events/:id/results/new'=> 'results#create', via: :post
    match '/events/:id/statistics'=> 'results#statistics', via: :get
     match '/events/:id/classfwd'=> 'results#classfwd', via: :get
      match '/events/:id/classrwd'=> 'results#classrwd', via: :get
       match '/events/:id/classawd'=> 'results#classawd', via: :get
       match '/events/:id/enrollments'=> 'enrollments#index', via: :get
       match 'users/:id/mygallery' => 'users#mygallery', via: :get
       match '/users/:user_id/usercars/:id' => "cars#usercarshow", via: :get 

      #match '/users/:id/usercars' => 'users#usercars' , via: :get
    # match '/events/:id/comments/show' => 'comments#show', via: :get
  root "welcome#Welcome"
  #get 'events'=>'events#events'
  #resources :events
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
