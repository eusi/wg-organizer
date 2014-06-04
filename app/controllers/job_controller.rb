class JobController < ActionController::Base
	layout 'application'
	
	def index
    @users = current_user.Sharedappartment.Users
    # put any code here that you need 
    # (although for a static view you probably won't have any)
  end

  def complete_task
    redirect_to '/job', :notice =>'Post abgeschickt'
    #Completedtask.complete_task()
  end

  def get_roomies
    @users = current_user.Sharedappartment.Users
  end

  def flat_tasks
    @tasks = current_user.Sharedappartment.Tasks
  end
end