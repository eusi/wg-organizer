class ProfileController < ActionController::Base

  before_action :authenticate_user!
  layout 'application'



  def index
    @user = User.find(current_user.id)
  end


  # This action is for creating a new shared-apartment.
  # It checks if the user is currently member of a shared-apartment and if the apartment is balanced.
  #
  #* *Result*:
  # - on Success: Calls the method for creating a new shared-apartment.
  # - on Failure: redirect to profile view with error message to payoff the apartment
  def createWG
    if (current_user.Sharedappartment == nil)
      create_new_apartment()
    else
      if (current_user.Sharedappartment.get_balance().all?{|k,v| v==0})
        #current_user.Sharedappartment.leave()
        create_new_apartment()
      else
        redirect_to '/profile', :alert => "Payoff your current shared flat before creating a new one"
      end
    end
  end


  # This method calls the model method for creating a new shared-apartment.
  # This will also add the current user to the new shared-apartment
  #
  #* *Result*:
  # - on Success: Current user is added to the new apartment and redirected to main view
  # - on Failure: redirect to profile view and corresponding error message
  def create_new_apartment
    @sharedappartment = Sharedappartment.create_sharedappartment(current_user, params[:sharedappartment][:name], params[:sharedappartment][:password])
    if @sharedappartment.valid?
      redirect_to '/main', :notice => "Succesfully created new shared flat"
    else
      redirect_to '/profile', :alert => @sharedappartment.errors.full_messages.to_sentence
    end
  end


  # This action is for joining a shared-apartment.
  # It checks if the user is currently member of a shared-apartment and if the apartment is balanced.
  #
  #* *Result*:
  # - on Success: Calls the method for joining an existing shared-apartment.
  # - on Failure: redirect to profile view with error message to payoff the apartment
  def joinWG
    if (current_user.Sharedappartment == nil)
      join_apartment
    else
      if (current_user.Sharedappartment.get_balance().all?{|k,v| v==0})
        #leave wg
        join_apartment()
      else
        redirect_to '/profile', :alert => "Payoff your current shared flat before joining a new one"
      end
    end
  end


  # This method calls the model method for joining an existing apartment.
  # It adds the current user to an existing apartment if the correct credentials are provided.
  #
  #* *Result*:
  # - on Success: Current user is added to the existing apartment and redirected to main view
  # - on Failure: redirect to profile view and corresponding error message
  def join_apartment
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
  end

  private :create_new_apartment, :join_apartment

end