class TasksController < ActionController::Base
	layout 'application'
	
	def index
	end

	def get_tasks
		@tasks = current_user.Sharedappartment.Tasks.where(is_deleted: [false,nil])
	end
	
	def set_task_as_deleted(task)
		task.set_as_deleted()
	end

    def create_task

      @task = Task.new(params[:task].permit(:task_name,:base_credit, :unit, :credit_per_unit, :task_description, :Sharedappartment_id))

      if @task.save
        redirect_to '/tasks', :notice => "Successfully created task"
      else
        redirect_to '/tasks', :alert => @task.errors.full_messages.to_sentence
      end
   	end
end