class SessionsController < Devise::SessionsController
  def create
     super
  end
  def new
     super
  end
end

#class Users::SessionsController < Devise::RegistrationsController

  #prepend_before_filter :set_devise_mapping

#private

 # def set_devise_mapping
 #   request.env["devise.mapping"] ||= Devise.mappings[:user]
 # end

#end