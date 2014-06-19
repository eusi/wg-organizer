class RegistrationsController < Devise::RegistrationsController
  layout :choose_layout
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy, :show]

  def resource_name
    :user
  end

  def new  
    @user = User.new
  end

  def create
    super
    @user = User.new sign_up_params
  end

  def edit
    super
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      #redirect_to after_update_path_for(resource), :flash => { :alert => "error message" }
      respond_with resource
    end
  end

  def destroy
    if(current_user.get_balance == 0)
      super
    else
      redirect_to '/profile', :alert => "Leave/payoff your current shared flat before canceling your account"
    end
  end

  def show
  end

  protected

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def after_update_path_for(resource)
    '/profile'
  end

  private

  #if user is logged in choose application-layout, otherwise home-layout
  def choose_layout
    user_signed_in? ? "application" : "home"
  end

end