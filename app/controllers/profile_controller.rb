class ProfileController < ActionController::Base
	layout 'application'
	
	def index
    end
    
    def createWG
    	@sharedappartment = Sharedappartment.create_sharedappartment(user,name,password)    	 	
    end

end