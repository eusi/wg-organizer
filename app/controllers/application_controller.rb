class ApplicationController < ActionController::Base

  layout 'home'
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:UserName, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :UserName, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:UserName, :email, :password, :password_confirmation, :current_password) }
  end

  protect_from_forgery

  private

  def after_sign_in_path_for(resource)
    '/main'
  end

  def after_sign_up_path_for(resource)
    '/profil'
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path #root_path
  end

end