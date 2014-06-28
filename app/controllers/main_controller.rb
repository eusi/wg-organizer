class MainController < ApplicationController

	before_action :authenticate_user!, :has_apartment
	layout 'application'

	# The index method redirects to profile page if user is not in a shared flat.
	# Additionaly it provides several objects that are needed for some elements in the main-view
	def index
		if(current_user.Sharedappartment_id==nil)
			redirect_to '/profile'
    else
      @payoffbalance = current_user.Sharedappartment.balance(false)
      @shouts = current_user.get_shoutbox_messages_of_appartment(5)
      @wg = current_user.Sharedappartment.name
      @last_activities = current_user.get_last_activities_of_appartment(3)
      @balance = current_user.Sharedappartment.get_balance
      @max_credits = current_user.Sharedappartment.get_max_credits( 0.2 )
      @min_credits = 0 #implement min credits in shared appartment: credits by "worst" roomie * 0,8
		end
	end


    #This method allows the user to save a new shoutmessage in the database
    #* *Result*:
    # - A redirect to the main page with success- or error-message
	def create_shout
		s = Shoutboxmessage.new()
		s.message = params[:shoutboxmessage][:message]
		s.User_id = current_user.id
		if s.save
			redirect_to :action => 'index'
			flash[:notice] = 'Thanks for shouting!'
		else
			redirect_to :action => 'index'
			flash[:alert] = 'Uups, something went wrong!'
			flash[:alert] = s.errors.full_messages.to_sentence
		end
 	end


    # This method calls the Sharedappartment-modle to balance all user accounts in this sharedappartment.
    #
    # * *Returns* :
    #   - @payoffbalance -> A hash with Key: the user. Value: The users' credits/debts towards the shared appartment as decimal value.
    # * *Result* :
    #   - returns @payoffbalance and the balance of all users will be executed
 	def payoff
	    begin
	      @payoffbalance = current_user.Sharedappartment.balance(true)
	      redirect_to '/main'
	      flash[:notice] = 'Account balances are resetted! New game, new chance!'
	    rescue
	      redirect_to '/main', :alert => "Whoops, something went wrong"
	    end
	end

end