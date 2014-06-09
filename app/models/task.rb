class Task < ActiveRecord::Base
has_many :Completedtasks, :dependent => :delete_all
belongs_to :Sharedappartment
validates :Sharedappartment, presence: true
validates :task_name, presence: true
validates :credit_per_unit, presence: true
validates :base_credit, presence: true
validates :task_description, length: { maximum: 2000 }

end
