class MainController < ActionController::Base

  before_action :authenticate_user!
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

  # This method calls the Sharedappartment-modle to balance all user accounts in this sharedappartment.
  # * *Args*    :
  #   - +reset+ -> If true, all completed tasks and charges will be archived.
  # * *Returns* :
  #   - @payoffbalance -> A hash with Key: the user. Value: The users' credits/debts towards the shared appartment as decimal value.
  # * *Result* :
  #   - if +reset+ is true: returns @payoffbalance and the balance of all users will be executed
  #   - if +reset+ is false: returns @payoffbalance without executing the balance of all users
  def payoff
    begin
      @payoffbalance = current_user.Sharedappartment.balance(params[:reset])
    rescue
      redirect_to '/main', :alert => "Whoops, something went wrong"
    end
  end

	def payoff
		render :partial => 'main/payoff'
	end

end