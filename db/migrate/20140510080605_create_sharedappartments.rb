class CreateSharedappartments < ActiveRecord::Migration
  def change
    create_table :sharedappartments do |t|
      t.string :Name
      t.string :Password
      t.timestamps
    end
  end
end
