class ProfileController < ActionController::Base
	layout 'application'
	
	def index
    @user = User.find(current_user.id)
    end
    
    def createWG
    	if(current_user.Sharedappartment_id==nil)
    		@sharedappartment = Sharedappartment.create_sharedappartment(current_user,params[:sharedappartment][:name],params[:sharedappartment][:password])
	        if @sharedappartment.valid?
	    		  redirect_to '/main', :notice => "Succesfully created new shared flat"
	        else
	          redirect_to '/profile', :alert => @sharedappartment.errors.full_messages.to_sentence
	        end
    	else
    		redirect_to '/profile', :notice => "Leave your current shared flat before creating a new one"
    	end
    end
    
    def joinWG
      begin
    	@sharedappartment= Sharedappartment.join_sharedappartment(current_user,params[:sharedappartment][:name],params[:sharedappartment][:password])
      rescue => error
        @sharedappartment = nil
      end

      if @sharedappartment
    	  redirect_to '/main', :notice => "Welcome to your shared flat!"
      else
        redirect_to '/profile', :alert => error.message
      end

    end
    
    def editProfile
    	#function should be able to change all profile settings
    	#if the user didnt enter a password (he let it blank), so he wont change the password (maybe he only wanted to change picture, for example)
    end

end