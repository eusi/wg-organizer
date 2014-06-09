class CreateCompletedtasks < ActiveRecord::Migration
  def change
    create_table :completedtasks do |t|
	t.decimal :amount
	t.text :summary
	t.datetime :task_start
	t.datetime :task_end
	t.boolean :task_verified
	t.decimal :credits
	t.references :User, index: true
	t.references :Task, index: true
    t.timestamps
    end
  end
end
