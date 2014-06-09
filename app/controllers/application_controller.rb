class ApplicationController < ActionController::Base

	layout 'home'
	protect_from_forgery with: :exception


	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation, :remember_me) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :user_name, :email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:user_name, :email, :Picture, :password, :password_confirmation, :current_password) }
	end

	protect_from_forgery

	private

	def after_sign_in_path_for(resource)
		if current_user.Sharedappartment_id != nil
			'/main'
		else 
			'/profile'
		end
	end

	def after_sign_up_path_for(resource)
		'/profile'
	end

	def after_sign_out_path_for(resource_or_scope)
    	'/home'   #new_user_session_path    #root_path
	end

	def after_update_path_for(resource)
		'/profile'
	end

end