class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|	
	t.decimal :credits
    t.timestamps
	 t.references :Completedtask, index: true
	  t.references :User, index: true
    end
  end
end
