class AddPictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Picture, :string
  end
end
