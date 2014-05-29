class CreateUserroles < ActiveRecord::Migration
  def change
    create_table :userroles do |t|
	t.string :RoleName
	t.integer :Priority

      t.timestamps
    end
  end
end
