class TasksController < ActionController::Base
	layout 'application'
	
	def index
    @tasks = current_user.Sharedappartment.Tasks.where(:is_deleted => [nil, false])
	end

  def delete_task
      begin
        Task.set_as_deleted(params[:deletableTask])
        redirect_to '/tasks', :notice => "Task successfully deleted!"
      rescue => error
        redirect_to '/tasks', :alert => "Whoops, something went wrong: "+error.message
      end
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