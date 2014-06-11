class JobController < ActionController::Base
	layout 'application'
	
	def index
  end

  def create_job
    #begin
    @completedtask = Completedtask.complete_task( current_user, 
                                                  params[:completedtask][:for_users],
                                                  params[:completedtask][:amount].to_i,
                                                  Task.find(params[:completedtask][:task_id]),
                                                  params[:completedtask][:task_start],
                                                  params[:completedtask][:task_end],
                                                  params[:completedtask][:summary])
    redirect_to '/job', :notice =>'Jobs done!'
    #rescue => error
     #@completedtask = nil
    #end
    #if @sharedappartment
      #redirect_to '/job', :notice =>'Jobs done!'
    #else
      #redirect_to '/jobs', :alert => error.message
    #end

  end

  def get_roomies
    @users = current_user.Sharedappartment.Users
  end

  def get_tasks
    @tasks = current_user.Sharedappartment.Tasks
  end
end