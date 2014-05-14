class CreateSharedAppartments < ActiveRecord::Migration
  def change
    create_table :shared_appartments do |t|
      t.string :Name
      t.string :Password
      t.timestamps
    end
  end
end
