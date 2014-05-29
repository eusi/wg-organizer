class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :Shoutboxmessages
has_many :Completedtasks
has_many :Charges
belongs_to :Userrole
belongs_to :Sharedappartment

def get_balance()
	result = Completedtask.where(:ByUser=>self).sum(:Credits)-Charge.where(:ForUser=>self).sum(:Credits)
end

def get_shoutbox_messages_of_appartment()
	current_appartment =self.Sharedappartment
	if(current_appartment!=nil)
		result=current_appartment.get_shoutbox_messages()
	else
		nil
	end
end

def get_last_activities_of_appartment()
current_appartment =self.Sharedappartment
	if(current_appartment!=nil)
		result=current_appartment.get_last_activities()
	else
		nil
	end	
end


end
