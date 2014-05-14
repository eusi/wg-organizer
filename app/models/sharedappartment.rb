class Sharedappartment < ActiveRecord::Base
validates_presence_of :Name
  validates_presence_of :Password
  has_many :Users
end
