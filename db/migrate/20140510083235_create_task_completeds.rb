class CreateTaskCompleteds < ActiveRecord::Migration
  def change
    create_table :task_completeds do |t|
	t.decimal :Amount
	t.text :Summary
	t.datetime :TaskStart
	t.datetime :TaskEnd
	t.boolean :TaskVerified
	t.decimal :Credits	
    t.timestamps
    end
  end
end
