class TasksController < ActionController::Base
	layout 'application'
	
	def index
    @tasks = current_user.Sharedappartment.Tasks
	end

  def delete_task
    #overwork and test me:
    #Task.delete( params[:deletableTask] )
    redirect_to '/tasks', :notice => "Task successfully deleted!"
  end

  def create_task
    @task = Task.new(params[:task].permit(:task_name,:base_credit, :unit, :credit_per_unit, :task_description, :Sharedappartment_id))

    if @task.save
      redirect_to '/tasks', :notice => "Task successfully created!"
    else
      redirect_to '/tasks', :alert => @task.errors.full_messages.to_sentence
    end
 	end

end