class RemovePasswordFromSharedappartments < ActiveRecord::Migration
  def change
    remove_column :sharedappartments, :Password, :string
  end
end
