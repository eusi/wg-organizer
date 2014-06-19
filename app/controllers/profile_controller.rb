class ProfileController < ActionController::Base

  before_action :authenticate_user!
  layout 'application'

  def index
    @user = User.find(current_user.id)
  end

  def createWG
    if (current_user.Sharedappartment_id==nil)
      @sharedappartment = Sharedappartment.create_sharedappartment(current_user, params[:sharedappartment][:name], params[:sharedappartment][:password])
      if @sharedappartment.valid?
        redirect_to '/main', :notice => "Succesfully created new shared flat"
      else
        redirect_to '/profile', :alert => @sharedappartment.errors.full_messages.to_sentence
      end
    else
      redirect_to '/profile', :alert => "Leave/payoff your current shared flat before creating a new one"
    end
  end

  def joinWG
    if (current_user.Sharedappartment_id==nil)
      begin
        @sharedappartment= Sharedappartment.join_sharedappartment(current_user, params[:sharedappartment][:name], params[:sharedappartment][:password])
      rescue => error
        @sharedappartment = nil
      end
      if @sharedappartment
        redirect_to '/main', :notice => "Welcome to your shared flat!"
      else
        redirect_to '/profile', :alert => "Whoops, something went wrong: "+error.message
      end
    else
      redirect_to '/profile', :alert => "Leave/payoff your current shared flat before joining a new one"
    end
  end

  def get_user_balance
    current_user.get_balance()
  end

end