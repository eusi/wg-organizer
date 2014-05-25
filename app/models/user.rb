class User < ActiveRecord::Base
has_many :Shoutboxmessages
has_many :Completedtasks
has_many :Charges
belongs_to :Userrole
belongs_to :Sharedappartment

def get_balance()
	
	
	result = Completedtask.where(:ByUser=>self).sum(:Credits)-Charge.where(:ForUser=>self).sum(:Credits)	
	
end

end
