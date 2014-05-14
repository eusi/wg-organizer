class User < ActiveRecord::Base
has_many :Shoutboxmessages
has_many :Completedtasks
has_many :Charges
belongs_to :Userrole
belongs_to :Sharedappartment
end
