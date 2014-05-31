class Sharedappartment < ActiveRecord::Base

has_many :Users
has_many :Tasks, :dependent => :delete_all

attr_accessor :password

validates :Name, uniqueness: true, presence: true,length: { maximum: 15 }

validates :password_hash, presence: true
validates :password_salt, presence: true
validates :password, presence: true, length: { in: 6..20 }, confirmation: true

	# This method gets all shoutbox messages of the shared appartment including user data. 
	# * *Args*    :
	#   - +limit+ -> The number of messages
	# * *Returns* :
	#   - An array of messages ordered by date	
	def get_shoutbox_messages(limit)

		users_of_appartment = self.Users	
		result=Shoutboxmessage.where(User_id:users_of_appartment).joins(:User).order(created_at: :desc).limit(limit)
	
	end
	
	# This method gets the last activities of the shared appartment including user and task data. 
	# * *Args*    :
	#   - +limit+ -> The number of activities.
	# * *Returns* :
	#   - An array of Completedtask items ordered by date.	
	def get_last_activities(limit)

		users_of_appartment = self.Users	
		result=Completedtask.where(User_id:users_of_appartment).joins(:ByUser).joins(:Task).order(created_at: :desc).limit(limit)
	
	end

	# This method calculates the current credits of every shared appartment member.	
	# * *Returns* :
	#   - A hash with the key [User_id,Username] and the credit value as decimal.	
	def get_balance()
		balances=Hash.new
			self.Users.each do |current_user|
				#calc balance
				result = Completedtask.where(:ByUser=>current_user).sum(:Credits)-Charge.where(:ForUser=>current_user).sum(:Credits)
				username_with_id=[current_user.id,current_user.UserName]				
				balances[username_with_id]=result
			end
		return balances
	end
	
	# This method creates a new shared appartment.	
	# * *Args*    :
	#   - +user+ -> The current user, who wants to create a new shared appartment.
	#   - +name+ -> The name of the new shared appartment.
	#   - +password+ -> The password of the shared appartment.
	# * *Returns* :
	#   - The new appartment.	
	def self.create_sharedappartment(user,name,password)
	
		new_sharedappartment= Sharedappartment.new
		new_sharedappartment.Name=name
		new_sharedappartment.password=password
		new_sharedappartment.password
		
		# generate hash and salt
		if !password.to_s.empty?
		  new_sharedappartment.password_salt = BCrypt::Engine.generate_salt
		  new_sharedappartment.password_hash = BCrypt::Engine.hash_secret(password, new_sharedappartment.password_salt)
		end
		
		new_sharedappartment.save()
		
		# if shared appartment has no errors --> join current user to the appartment
		if(user!=nil && new_sharedappartment.valid?)
		  user.Sharedappartment=new_sharedappartment
		  user.save()
		end
		new_sharedappartment
	end
	
	# This method joins an user to a shared appartment.	
	# * *Args*    :
	#   - +user+ -> The current user, who wants to join a shared appartment.
	#   - +name+ -> The name of the shared appartment.
	#   - +password+ -> The password of the shared appartment.
	# * *Returns* :
	#   - if the join was succesfull: The new appartment Else: nil
	# * *Raises* :
	#   - +ArgumentError+ -> if any value is nil or negative
	def self.join_sharedappartment(user,name,password)

		if(user==nil)
			raise ArgumentError.new("User is empty.")
		end
		
		if(name.to_s.empty?)
			raise ArgumentError.new("Name is invalid.")
		end
		
		if(password.to_s.empty?)
			raise ArgumentError.new("Password is invalid.")
		end
		
		existing_sharedappartment= Sharedappartment.where(:Name=>name).first
		
		if(existing_sharedappartment==nil)
			raise 'Shared appartment ' + name + ' does not exist.'
		end
		
		existing_hash = BCrypt::Password.new(existing_sharedappartment.password_hash)
		
		given_password_hash = BCrypt::Engine.hash_secret(password, existing_sharedappartment.password_salt)

		if(given_password_hash!=existing_hash)
		  raise 'Wrong password'
		else
			user.Sharedappartment=existing_sharedappartment
			user.save()
			return existing_sharedappartment
		end
	  
	  return nil;
	end


	# This method checks if a shared appartment with the given name already exists.	
	# * *Args*    :	#   
	#   - +name+ -> The name of the shared appartment.	#   
	# * *Returns* :
	#   - true if found
	def self.check_sharedappartment_exists(name)
		result = Sharedappartment.where(:Name=>name).first!=nil
	end

end
