class TasksController < ActionController::Base

  before_action :authenticate_user!
	layout 'application'
	
	def index
    @tasks = current_user.Sharedappartment.Tasks.where(:is_deleted => [nil, false])
	end

  #This method deletes a task respectively makes it invisible for the users
  #* *Result*:
  # - on Success: Provided task is set to deleted in the database and redirect to task view
  # - on Failure: redirect to profile view with error message
  def delete_task
      begin
        Task.set_as_deleted(params[:deletableTask])
        redirect_to '/tasks', :notice => "Task successfully deleted!"
      rescue => error
        redirect_to '/tasks', :alert => "Whoops, something went wrong: "
      end
  end

  #This method enables the user to create a new task in the database.
  #
  #* *Result*:
  # - on success: A new task is added to the database and redirect to task view
  # - on failure: redirect to task view with error message
  def create_task
    @task = Task.new(params[:task].permit(:task_name,:base_credit, :unit, :credit_per_unit, :task_description, :Sharedappartment_id))

    if @task.save
      redirect_to '/tasks', :notice => "Task successfully created!"
    else
      redirect_to '/tasks', :alert => @task.errors.full_messages.to_sentence
    end
 	end

end