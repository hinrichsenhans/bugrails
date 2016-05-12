Rails.application.routes.draw do
  root 'static_pages#home'

  resources :bugs, :except => [:destroy, :update, :create] do
    member do
      post :update, controller: 'bug_update'
      patch :update, controller: 'bug_update'
      delete 'delete/:comment_id', controller: 'bug_update', action: 'delete_comment', :as => :delete_comment
    end

    collection do
      post :create, controller: 'bug_update'
      get 'all', action: 'index_all'
    end

  end

  get 'bugdemo' => 'static_pages#bugdemo'
  get 'admin' => 'static_pages#admin'

  get 'getlogin' => 'static_pages#getlogin'
  get 'login' => 'static_pages#home'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'getsignup' => 'static_pages#getsignup'
  post 'signup' => 'users#signup'

  # post 'activate/:token' => 'account_admin#activate', as: :activation
  get 'activate/:token' => 'account_admin#activate', as: :activation

  get 'reset' => 'account_admin#reset_request', as: :reset_request
  post 'reset' => 'account_admin#send_reset', as: :send_reset
  get 'reset/:id' => 'account_admin#reset_form', as: :change_password
  post 'reset/:id' => 'account_admin#process_reset', as: :process_reset

  resources :users 
  
  resources :products, :except => ['show'] do
    resources :components
    resources :versions
    resources :milestones
  end

  get 'productformobject' => 'products#get_form_object'

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
