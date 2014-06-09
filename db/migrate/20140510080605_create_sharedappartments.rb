class CreateSharedappartments < ActiveRecord::Migration
  def change
    create_table :sharedappartments do |t|
      t.string :name
      t.string :password
      t.timestamps
    end
  end
end
