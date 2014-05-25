class Sharedappartment < ActiveRecord::Base
validates_presence_of :Name
  validates_presence_of :Password
  has_many :Users
  
  def get_user()
	allusers=User.where(:Sharedappartment=>self)
  end
  

  def get_balance()
	
	balances=Hash.new
	get_user().each do |current_user|
	
	result = Completedtask.where(:ByUser=>current_user).sum(:Credits)-Charge.where(:ForUser=>current_user).sum(:Credits)	
	balances[current_user]=result
	end
	balances
	
end
  
end
