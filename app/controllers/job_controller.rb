class JobController < ActionController::Base
	layout 'application'
	
	def index
  end

  def create_job
    @completedtask = Completedtask.complete_task()
    redirect_to '/job', :notice =>'Jobs done!'
  end

  def get_roomies
    @users = current_user.Sharedappartment.Users
  end

  def get_tasks
    @tasks = current_user.Sharedappartment.Tasks
  end
end