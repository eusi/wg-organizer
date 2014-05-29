class MainController < ActionController::Base
	layout 'application'
	
	def index
    	if(current_user.Sharedappartment_id==nil)
    		redirect_to '/profile'
    	end
		#@shouts = Shout.all_shouts
	end

	def create
	  @shouts = Shout.all_shouts
	 
	  @shout = Shout.new(params[:shout])
	  if @shout.save
	    flash[:notice] = 'Thanks for shouting!'
	    redirect_to :action => 'index'
	  else
	    render :action => 'index'
	  end
	end

end