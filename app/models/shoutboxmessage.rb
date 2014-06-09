class Shoutboxmessage < ActiveRecord::Base
	belongs_to :User
	validates :message, presence: true,length: { maximum: 2000 }
	validates :User, presence: true
end
