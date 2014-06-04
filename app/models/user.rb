class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :Shoutboxmessages, :dependent => :delete_all
	has_many :Completedtasks, :dependent => :delete_all
	has_many :Charges, :dependent => :delete_all
	belongs_to :Userrole
	belongs_to :Sharedappartment
	validates :UserName, presence: true, length: { in: 3..25 }
	validates :FirstName, length: { maximum: 35 }
	validates :LastName, length: { maximum: 35 }
	
	# This method calculates the current credits of the user.	
	# * *Returns* :
	#   - The credit value as decimal.	
	def get_balance()
		result = Completedtask.where(:is_archived=>0).where(:ByUser=>self).sum(:Credits)-Charge.where(:is_archived=>0).where(:ForUser=>self).sum(:Credits)
	end
	
	# This method gets all shoutbox messages of the user's shared appartment including user data. 
	# * *Args*    :
	#   - +limit+ -> The number of messages
	# * *Returns* :
	#   - An array of messages ordered by date	
	def get_shoutbox_messages_of_appartment(limit)
		current_appartment =self.Sharedappartment
		if(current_appartment!=nil)
			result=current_appartment.get_shoutbox_messages(limit)
		else
			nil
		end
	end
	
	# This method gets the last activities of the user's shared appartment including user and task data. 
	# * *Args*    :
	#   - +limit+ -> The number of activities.
	# * *Returns* :
	#   - An array of Completedtask items ordered by date.	
	def get_last_activities_of_appartment(limit)
		current_appartment =self.Sharedappartment
		if(current_appartment!=nil)
			result=current_appartment.get_last_activities(limit)
		else
			nil
		end	
	end


end
