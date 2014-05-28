class Sharedappartment < ActiveRecord::Base
validates :Name, uniqueness: true, presence: true,length: { maximum: 15 }
validates :password_hash, presence: true
validates :password_salt, presence: true
has_many :Users
has_many :Tasks, :dependent => :delete_all


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
    raise 'Sharedappartment not found.'
  else
    existing_hash = BCrypt::Password.new(existing_sharedappartment.password_hash)
    if password.to_s.empty?
      raise 'Password is emtpy'
    else
      given_password_hash = BCrypt::Engine.hash_secret(password, existing_sharedappartment.password_salt)

      if(given_password_hash!=existing_hash)
        raise 'Wrong password'
      else
        user.Sharedappartment=existing_sharedappartment
        user.save()

      end
    end
  end
  existing_sharedappartment
end



  def self.check_sharedappartment_exists(name)
    result = Sharedappartment.where(:Name=>name).first!=nil
  end

end
