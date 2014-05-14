class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.string :UserName
	t.string :FirstName
	t.string :LastName
	t.string :Password
	t.binary :Picture
	t.string :Email
      t.timestamps
    end
  end
end
