class Task < ActiveRecord::Base
has_many :Completedtasks, :dependent => :delete_all
belongs_to :Sharedappartment
validates :Sharedappartment, presence: true
validates :task_name, presence: true
validates :credit_per_unit, presence: true, numericality: true
validates :base_credit, presence: true, numericality: true
validates :task_description, length: { maximum: 2000 }

	# This method sets a task as deleted.	
	def self.set_as_deleted(id)

		t = Task.find(id)
    if(t)
      t.is_deleted=true
		  t.save()
    else
      raise ArgumentError.new("Task not found!")
    end
	end

end