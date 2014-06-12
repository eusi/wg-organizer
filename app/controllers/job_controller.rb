class JobController < ActionController::Base
	layout 'application'
	
	def index
   @roomies = current_user.Sharedappartment.Users
   @tasks = current_user.Sharedappartment.Tasks
  end

  def create_job
    begin
      @completedtask = Completedtask.complete_task( current_user,
                                                  params[:completedtask][:for_users],
                                                  params[:completedtask][:amount].to_i,
                                                  Task.find(params[:completedtask][:task_id]),
                                                  params[:completedtask][:task_start],
                                                  params[:completedtask][:task_end],
                                                  params[:completedtask][:summary])

    rescue => error
      @completedtask = nil
    end

    if @completedtask
      redirect_to '/job', :notice =>'Jobs done!'
    else
      redirect_to '/jobs', :alert => error.message
    end

  end

end