class Completedtask < ActiveRecord::Base
belongs_to :ByUser,:class_name => "User", :foreign_key => 'User_id'	
belongs_to :Task
has_many :Charges
end
