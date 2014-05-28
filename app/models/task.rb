class Task < ActiveRecord::Base
has_many :Completedtasks
belongs_to :Sharedappartment
end
