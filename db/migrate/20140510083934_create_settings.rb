class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
	t.boolean :verify_task_completed
	t.boolean :verify_create_new_task
    t.timestamps
    end
  end
end
