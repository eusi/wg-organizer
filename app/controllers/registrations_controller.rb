class RegistrationsController < Devise::RegistrationsController
  layout 'login'
  skip_before_filter :require_no_authentication
  before_filter :resource_name

  def resource_name
    :user
  end

  def new  
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end
end