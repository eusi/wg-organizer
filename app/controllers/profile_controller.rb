class ProfileController < ActionController::Base
	layout 'application'
	
	def index
    end
    
    def createWG
    	if(current_user.Sharedappartment_id==nil)
    		@sharedappartment = Sharedappartment.create_sharedappartment(current_user,params[:name],params[:password])
    		redirect_to '/profile', :notice => "Succesfully created new sharedappartment"
    		
    	else
    		redirect_to '/profile', :notice => "Leave your sharedappartment before creating a new one"
    	end
    	    	 	
    end
    
    def joinWG
    	@sharedappartment= Sharedappartment.join_sharedappartment(current_user,params[:name],params[:password])
    	redirect_to '/profile', :notice => "Welcome to your sharedappartment!"
    end
    
    def edit
    	
    end

end