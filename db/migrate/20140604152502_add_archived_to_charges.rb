class AddArchivedToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :is_archived, :booelan, :default => false
  end
end
