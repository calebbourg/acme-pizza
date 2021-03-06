Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :orders

  namespace :cashier, module: 'cashier' do
    resources :dashboards, only: [:index]
    put 'dasboards/complete_order/:order_id', to: 'dashboards#complete_order', as: :dashboards_complete_order
  end

  namespace :baker, module: 'baker' do
    resources :dashboards, only: [:index]
    put 'dashboards/order_ready/:order_id', to: 'dashboards#order_ready', as: :dashboards_order_ready
    put 'dashboards/start_order/:order_id', to: 'dashboards#start_order', as: :dashboards_start_order
  end

  namespace :manager, module: 'manager' do
    resources :dashboards, only: [:index]
  end

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
