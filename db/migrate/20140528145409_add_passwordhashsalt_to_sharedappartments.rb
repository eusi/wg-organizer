class AddPasswordhashsaltToSharedappartments < ActiveRecord::Migration
  def change
    add_column :sharedappartments, :password_salt, :string
    add_column :sharedappartments, :password_hash, :string
  end
end
