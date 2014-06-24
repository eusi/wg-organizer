WGOrganizer::Application.routes.draw do
    devise_for :users, 
    :skip => [:sessions, :passwords, :confirmations], #:registrations
    :controllers => { :registrations => :registrations, :passwords => :passwords }

  devise_scope :user do
    # joining
    #post '/signup' => 'devise/registrations#create', :as => "user_registration_path"
    #get  "/join" => "devise/registrations#new",      :as => "new_user_registration"
    #post "/join" => "devise/registrations#create",   :as => "user_registration"

    # settings & cancellation
    #get "/cancel"   => "devise/registrations#cancel", :as => "cancel_user_registration"
    #get "/settings" => "devise/registrations#edit",   :as => "edit_user_registration"
    #put "/settings" => "devise/registrations#update"

    # confirmation
    get  "/confirm"        => "devise/confirmations#show",  :as => "user_confirmation"
    post "/confirm"        => "devise/confirmations#create"
    get  "/confirm/resend" => "devise/confirmations#new",   :as => "new_user_confirmation"

    # account deletion
    delete "" => "devise/registrations#destroy"

    # password reset
    post "/reset-password"        => "passwords#create",        :as => :user_password
    get  "/reset-password"        => "passwords#new",           :as => :new_user_password
    get  "/reset-password/change" => "passwords#edit",          :as => :edit_user_password

    # session handling
   	get  "/signin"  => "sessions#new",                    :as => :new_user_session
   	post "/signin"  => "sessions#create",                 :as => :user_session
   	get  "/signout" => "sessions#destroy", via: :destroy, :as => :destroy_user_session,
   	:via => Devise.mappings[:user].sign_out_via
  end

  authenticated :user do
    devise_scope :user do
      root to: "main#index", :as => "main"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/registrations#new", :as => "home"
    end
  end

  get "home" => "home#_index" #startpage before you logged in

  get "main" => "main#index" #mainpage after you logged in
  post "main/create_shout" => "main#create_shout"
  get "main/payoff" => "main#payoff"
    
  get "job" => "job#index" #addjob
  post "job/create_job" => "job#create_job"

  get "tasks" => "tasks#index" #task management
  post "tasks/create_task" => "tasks#create_task"
  post "tasks/delete_task" => "tasks#delete_task"
    
  get "profile" => "profile#_index" #profile and choosen!
  post "profile/createWG" => "profile#createWG"
  post "profile/joinWG" => "profile#joinWG"

  get "aboutus" => "imprint#index" #about us == imprint atm
  get "imprint" => "imprint#index" #imprint
  get "disclaimer" => "imprint#disclaimer" #disclaimer

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root "welcome#index"

  # Example of regular route:
  #   get "products/:id" => "catalog#view"

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get "products/:id/purchase" => "catalog#purchase", as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get "short"
  #       post "toggle"
  #     end
  #
  #     collection do
  #       get "sold"
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
  #       get "recent", on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post "toggle"
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
