class MainController < ActionController::Base
	layout 'application'
	
	def index
    	if(current_user.Sharedappartment_id==nil)
    		redirect_to '/profile'
    	end
      @shouts = current_user.get_shoutbox_messages_of_appartment(2)
	end

	#
=begin
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
=end

  def last_activities
    @completedtasks = current_user.get_last_activities_of_appartment
  end

  def appartment_balance
    dictionary = current_user.Sharedappartment.get_balance
  end

  def create_shout
    s = Shoutboxmessage.new()
    s.Message = params[:shoutboxmessage][:Message]
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





end