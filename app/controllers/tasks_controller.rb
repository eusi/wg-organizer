class TasksController < ActionController::Base
	layout 'application'
	
	def index
	end

	def get_tasks
		@tasks = current_user.Sharedappartment.Tasks
	end

    def create_task
   		@sharedappartment = Sharedappartment.create_task() #modify!
	    redirect_to '/tasks'
    end
end