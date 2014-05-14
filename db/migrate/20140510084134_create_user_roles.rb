class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
	t.string :RoleName
	t.integer :Priority

      t.timestamps
    end
  end
end
