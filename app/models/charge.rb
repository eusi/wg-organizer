class Charge < ActiveRecord::Base
belongs_to :Completedtask
belongs_to :ForUser,:class_name => "User", :foreign_key => 'User_id'	
end
