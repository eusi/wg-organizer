class Sharedappartment < ActiveRecord::Base

has_many :Users
has_many :Tasks, :dependent => :delete_all

attr_accessor :password

validates :Name, uniqueness: true, presence: true,length: { maximum: 15 }
validates :password, presence: true
#validates :password_hash, presence: true
#validates :password_salt, presence: true


	def get_shoutbox_messages()

		users_of_appartment = self.Users	
		result=Shoutboxmessage.where(User_id:users_of_appartment).joins(:User).order(created_at: :desc)
	
	end

	def get_last_activities()

		users_of_appartment = self.Users	
		result=Completedtask.where(User_id:users_of_appartment).joins(:ByUser).joins(:Task).order(created_at: :desc)
	
	end


  def get_balance()

	balances=Hash.new
  self.Users.each do |current_user|

	result = Completedtask.where(:ByUser=>current_user).sum(:Credits)-Charge.where(:ForUser=>current_user).sum(:Credits)
	username_with_id=[current_user.id,current_user.UserName]

  balances[username_with_id]=result
	end
	balances
  end

  def self.create_sharedappartment(user,name,password)

    new_sharedappartment= Sharedappartment.new
    new_sharedappartment.Name=name

    if !password.to_s.empty?

      new_sharedappartment.password_salt = BCrypt::Engine.generate_salt
      new_sharedappartment.password_hash = BCrypt::Engine.hash_secret(password, new_sharedappartment.password_salt)

    end

    new_sharedappartment.save()

    if(user!=nil && new_sharedappartment.valid?)
      user.Sharedappartment=new_sharedappartment
      user.save()
    end
    new_sharedappartment
  end

def self.join_sharedappartment(user,name,password)

  if(user==nil)
    raise 'User is empty.'
  end
  existing_sharedappartment= Sharedappartment.where(:Name=>name).first
  if(existing_sharedappartment==nil)
    nil
  else
    existing_hash = BCrypt::Password.new(existing_sharedappartment.password_hash)
    given_password_hash = BCrypt::Engine.hash_secret(password, existing_sharedappartment.password_salt)

    if(given_password_hash!=existing_hash)
      nil
    else
        user.Sharedappartment=existing_sharedappartment
        user.save()
        return existing_sharedappartment

    end
  end
  return nil;
end



  def self.check_sharedappartment_exists(name)
    result = Sharedappartment.where(:Name=>name).first!=nil
  end

end
