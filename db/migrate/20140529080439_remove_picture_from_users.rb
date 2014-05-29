class RemovePictureFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Picture, :binary
  end
end
