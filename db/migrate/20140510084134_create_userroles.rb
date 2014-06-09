class CreateUserroles < ActiveRecord::Migration
  def change
    create_table :userroles do |t|
	t.string :role_name
	t.integer :priority

      t.timestamps
    end
  end
end
