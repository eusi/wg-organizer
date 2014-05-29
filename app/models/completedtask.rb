class Completedtask < ActiveRecord::Base
belongs_to :ByUser,:class_name => "User", :foreign_key => 'User_id'	
belongs_to :Task
has_many :Charges, :dependent => :delete_all

def self.complete_task(by_user,for_users,amount,task,task_start,task_end,summary)
	
	print "Calc credits\n"
	credits = amount * task.CreditPerUnit.to_f + task.BaseCredit
	print credits
	print "\n"

	
	completed_task= Completedtask.create(:Amount=>amount, :Credits=>credits,:Task=>task,:ByUser=>by_user,:TaskStart=>task_start,:TaskEnd=>task_end,:Summary=>summary)
	print "Completed task sucessfully saved\n"
	
	if for_users.size!=0
	print "Calc charges per user\n"	
	
	credits_per_user = (credits/for_users.size.to_f	)
	print "Credit per user: "
	print  credits_per_user 
	print "\n"
	for_users.each do |for_user|
	
	current_charge = Charge.create(:Credits=>credits_per_user,:ForUser=>for_user,:Completedtask=>completed_task)

	end
	end
	print "Transaction finished\n"	
	
end

end
