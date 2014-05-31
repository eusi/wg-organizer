class Task < ActiveRecord::Base
has_many :Completedtasks, :dependent => :delete_all
belongs_to :Sharedappartment
validates :Sharedappartment, presence: true
validates :Taskname, presence: true
validates :CreditPerUnit, presence: true
validates :BaseCredit, presence: true
validates :Taskdescription, length: { maximum: 2000 }

end
