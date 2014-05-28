class RegistrationsController < Devise::RegistrationsController
  #skip_before_filter :require_no_authentication
  #before_filter :resource_name
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy, :show]

  def resource_name
    :user
  end

  def new  
    @user = User.new
  end

  def create
    @user = User.new sign_up_params
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def show
  end

  protected

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

end