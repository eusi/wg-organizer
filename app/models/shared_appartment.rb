class SharedAppartment < ActiveRecord::Base
validates_presence_of :Name
  validates_presence_of :Password
end
