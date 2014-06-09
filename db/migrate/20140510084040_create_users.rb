class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.string :user_name
	t.string :first_name
	t.string :last_name
	t.string :password
	t.binary :picture
	t.string :email
      t.timestamps
	  t.references :Userrole, index: true
	  t.references :Sharedappartment, index: true
    end
  end
end
