Rails.application.routes.draw do


  devise_for :users

  resources :users, only: [] do
    resources :essays
    resources :arguments, except: [:show, :new] do
      get '/upvote' => 'votes#upvote'
      get '/downvote' => 'votes#downvote'
    end
  end

  put 'arguments/:id/add_judges', to: 'arguments#add_judges'

  put '/users/:user_id/arguments/:id/transition_to_being_judged', to: 'arguments#transition_to_being_judged'

  get '/users/:user_id/essays/:essay_id/arguments/new', to: 'arguments#new'

  resources :arguments, only: [:show] do
    member do
      patch 'submit_to_judgement'
    end
  end

  root 'welcome#index'

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
