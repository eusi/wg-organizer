class CreateCompletedtasks < ActiveRecord::Migration
  def change
    create_table :completedtasks do |t|
	t.decimal :Amount
	t.text :Summary
	t.datetime :TaskStart
	t.datetime :TaskEnd
	t.boolean :TaskVerified
	t.decimal :Credits	
	t.references :User, index: true
	t.references :Task, index: true
    t.timestamps
    end
  end
end
