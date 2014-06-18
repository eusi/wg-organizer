class JobController < ActionController::Base
	layout 'application'
	
	def index
   @roomies = current_user.Sharedappartment.Users
   @tasks = current_user.Sharedappartment.Tasks
  end


  # This method can be used by an user to complete a task.
  # It passes the POST-params from the view to the specific modle-method "complete-task".
  # It handles the error message from modle if available.
  #
  # * Arguments passed to complete-task:
  #   - +current_user+ -> The user, who has completed the task.
  #   - +for_users+ -> An array of users ids for whom the task was completed.
  #   - +amount+ -> The amount of work which was done by the user.
  #   - +task_id+ -> The task id.
  #   - +task_start+ -> The beginning of the task.
  #   - +task_end+ -> The end of the task.
  #   - +summary+ -> Summary of the task.
  #
  # * *Result* :
  #   on Success:
  #   redirects to the job view with succes-message
  #   on Error:
  #   redirect to job view with error-message
  def create_job
    begin
      @completedtask = Completedtask.complete_task( current_user,
                                                  params[:completedtask][:for_users],
                                                  params[:completedtask][:amount].to_i,
                                                  params[:completedtask][:task_id],
                                                  params[:completedtask][:task_start],
                                                  params[:completedtask][:task_end],
                                                  params[:completedtask][:summary])

    rescue => error
      @completedtask = nil
    end

    if @completedtask
      redirect_to '/job', :notice =>'Jobs done!'
    else
      redirect_to '/job', :alert => error.message
    end
  end

end