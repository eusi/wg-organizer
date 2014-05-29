WGOrganizer::Application.routes.draw do
    devise_for :users, :skip => [:sessions]

    devise_scope :user do
      get '/signin' => 'sessions#new', :as => :new_user_session
      post '/signin' => 'sessions#create', :as => :user_session
    get '/signout' => 'sessions#destroy', via: :destroy, :as => :destroy_user_session, #match instead of get?
    :via => Devise.mappings[:user].sign_out_via
  end

  authenticated :user do
    devise_scope :user do
      root to: 'main#index', :as => "main"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: 'devise/registrations#new', :as => "unauthenticated"
    end
  end

  #as :user do
    # using login path for registration
    #get '/login' => 'registrations#new', :as => :new_user_registration
    #post '/signup' => 'registrations#create', :as => :user_registration
    #post '/signin' => 'sessions#new', :as => :new_user_session
    #post '/signin' => 'sessions#create', :as => :user_session
  #end

  get "choose" => 'choose#index'
  get "home" => 'home#_index' #startpage before you logged in

  get "main" => 'main#index' #mainpage after you logged in
   get "job" => 'job#index'
  get "profile" => 'profile#index'
  get "tasks" => 'tasks#index'
  
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
