class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :Shoutboxmessages
has_many :Completedtasks
has_many :Charges
belongs_to :Userrole
belongs_to :Sharedappartment
end
