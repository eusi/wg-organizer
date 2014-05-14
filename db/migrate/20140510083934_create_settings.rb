class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
	t.boolean :VerifyTaskCompleted
	t.boolean :VerifyCreateNewTask
    t.timestamps
    end
  end
end
