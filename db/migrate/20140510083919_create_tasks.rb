class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
	t.string :task_name
	t.decimal :credit_per_unit
	t.decimal :base_credit
  t.string :unit
	t.text :task_description
    t.timestamps
  t.references :Sharedappartment, index: true
    end
  end
end
