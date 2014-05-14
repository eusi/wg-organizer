class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
	t.string :Taskname
	t.decimal :CreditPerUnit
	t.decimal :BaseCredit
	t.text :Taskdescription
    t.timestamps
    end
  end
end
