class RemovePasswordEmailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
    remove_column :users, :email, :string
    
  end
end
