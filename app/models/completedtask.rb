class Completedtask < ActiveRecord::Base
belongs_to :ByUser,:class_name => "User", :foreign_key => 'User_id'	
belongs_to :Task
has_many :Charges, :dependent => :delete_all
validates :summary, length: { maximum: 400 }
validates :ByUser, presence: true
validates :Task, presence: true
validates :amount, presence: true, numericality: true
validates :credits, presence: true

attr_accessor :for_users
attr_accessor :by_user
attr_accessor :amount
attr_accessor :task_id
attr_accessor :task_start
attr_accessor :task_end
attr_accessor :summary

validates :for_users, presence: true, allow_nil: false
validates :amount, presence: true, numericality:true
	# This method can be used by an user to complete a task. 
	# * *Args*    :
	#   - +by_user+ -> The user, who has completed the task.
	#   - +for_users+ -> An array of users ids for whom the task was completed.
	#   - +amount+ -> The amount of work which was done by the user.
	#   - +task_id+ -> The task id.
	#   - +task_start+ -> The beginning of the task.
	#   - +task_end+ -> The end of the task.
	#   - +summary+ -> Summary of the task.
	# * *Returns* :
	#   - nothing
	# * *Raises* :
	#   - +ArgumentError+ -> if any value is nil or negative
	def self.complete_task(by_user,for_users,amount,task_id,task_start,task_end,summary)

		if(by_user==nil)
			raise ArgumentError.new("By user is empty.")
		end
		
		if(task_id==nil)
			raise ArgumentError.new("Task is empty.")
		end
		
		if(amount==nil)
			raise ArgumentError.new("Amount is empty.")
		end
		
		if(for_users==nil or for_users.size==0)
			raise ArgumentError.new("No users selected")		
		end
		
		task = Task.find(task_id)
		if(task==nil)
			raise ArgumentError.new("Task could not be found.")
		end
		
		#calc credits
		credits = amount * task.credit_per_unit + task.base_credit
				
		ActiveRecord::Base.transaction do
		
			#save completed task		
			completed_task= Completedtask.create(:amount=>amount, :credits=>credits,:Task=>task,:ByUser=>by_user,:task_start=>task_start,:task_end=>task_end,:summary=>summary)
			print "Completed task sucessfully saved\n"
			
			#check if the job was done for all appartment members
			if for_users.size<by_user.Sharedappartment.Users.size			
			#charge the other appartment members		
			
				#calc charge
				credits_per_user = (credits/for_users.size.to_f	)
				
				#save charge
				for_users.each do |for_user_id|		
					current_charge = Charge.create(:credits=>credits_per_user,:User_id=>for_user_id,:Completedtask=>completed_task)
				end
			
			end
			return completed_task
		end
		
		
	end

end
