class RemovePasswordFromSharedappartments < ActiveRecord::Migration
  def change
    remove_column :sharedappartments, :password, :string
  end
end
