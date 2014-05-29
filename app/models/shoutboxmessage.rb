class Shoutboxmessage < ActiveRecord::Base
	belongs_to :User
	validates :Message, presence: true,length: { maximum: 2000 }
	
	
	
end
