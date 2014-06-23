class ProfileController < ActionController::Base

  before_action :authenticate_user!
  layout 'application'

  def index
    @user = User.find(current_user.id)
  end

  #This method checks if the user is currently member of a shared-apartment or not and calls the model method for creating a new shared-apartment
  #It adds the current user to the new appartment.
  #
  #* *Result*:
  # - on Success: Current user is added to the new apartment and redirected to main view
  # - on Failure: redirect to profile view and corresponding error message
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

  #This method checks if the user is currently member of a shared-apartment or not and calls the model method for joining an existing shared-apartment.
  #It adds the current user to the existing apartment if he provides the correct password.
  #
  #* *Result*:
  # - on Success: Current user is added to the existing apartment and redirected to main view
  # - on Failure: redirect to profile view and corresponding error message
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

end