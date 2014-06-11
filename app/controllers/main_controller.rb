class MainController < ActionController::Base
	layout 'application'
	
	def index
		if(current_user.Sharedappartment_id==nil)
			redirect_to '/profile'
		end
		@shouts = current_user.get_shoutbox_messages_of_appartment(5)
	end

	def last_activities
		@completedtasks = current_user.get_last_activities_of_appartment(5)
	end

	def appartment_balance
		current_user.Sharedappartment.get_balance
	end

	def create_shout
		s = Shoutboxmessage.new()
		s.message = params[:shoutboxmessage][:message]
		s.User_id = current_user.id
		if s.save
			redirect_to :action => 'index'
			#flash[:notice] = 'Thanks for shouting!'

		else
			redirect_to :action => 'index'
			flash[:alert] = 'Uups, something went wrong!'
			flash[:alert] = s.errors.full_messages.to_sentence
		end
	end

end