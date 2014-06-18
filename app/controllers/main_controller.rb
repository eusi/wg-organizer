class MainController < ActionController::Base
	layout 'application'

	def index
		@event = "test"
		if(current_user.Sharedappartment_id==nil)
			redirect_to '/profile'

		@users = Users.all
		end

		@shouts = current_user.get_shoutbox_messages_of_appartment(5)
		@wg = current_user.Sharedappartment.name
		@last_activities = current_user.get_last_activities_of_appartment(3)
		@balance = current_user.Sharedappartment.get_balance
		@max_credits = current_user.Sharedappartment.get_max_credits( 0.2 )
		@min_credits = 0 #implement min credits in shared appartment: credits by "worst" roomie * 0,8
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