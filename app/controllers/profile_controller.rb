class ProfileController < ActionController::Base
	layout 'application'
	
	def index
    end
    
    def createWG
    	if(current_user.Sharedappartment_id==nil)
    		@sharedappartment = Sharedappartment.create_sharedappartment(current_user,params[:sharedappartment][:name],params[:sharedappartment][:password])
        if @sharedappartment.valid?
    		  redirect_to '/profile', :notice => "Succesfully created new shared flat"
        else
          redirect_to '/profile', :alert => @sharedappartment.errors.full_messages.to_sentence
        end
    	else
    		redirect_to '/profile', :notice => "Leave your current shared flat before creating a new one"
    	end
    end
    
    def joinWG
    	@sharedappartment= Sharedappartment.join_sharedappartment(current_user,params[:sharedappartment][:name],params[:sharedappartment][:password])
      if @sharedappartment
    	  redirect_to '/profile', :notice => "Welcome to your shared flat!"
      else
        redirect_to '/profile', :alert => "Wrong name or password"
      end
    end
    
    def edit

    end

end