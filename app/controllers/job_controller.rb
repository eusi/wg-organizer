class JobController < ActionController::Base
	layout 'application'
	
	def index
  end

  def create_job
    redirect_to '/job', :notice =>'Jobs done!'
    #Completedtask.complete_task()
  end

  def get_roomies
    @users = current_user.Sharedappartment.Users
  end

  def get_tasks
    @tasks = current_user.Sharedappartment.Tasks
  end
end