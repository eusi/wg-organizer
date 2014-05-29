class RemovePasswordEmailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Password, :string
    remove_column :users, :Email, :string
    
  end
end
